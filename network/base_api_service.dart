import 'dart:async';
import 'dart:io';

import 'package:pessa_flow/constants/route.dart';
import 'package:pessa_flow/generated/l10n.dart';
import 'package:pessa_flow/network/api_client.dart';
import 'package:pessa_flow/pref/app_pref.dart';
import 'package:pessa_flow/utils/connectivity_utils.dart';
import 'package:pessa_flow/widgets/loading_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../utils/app_logger.dart';
import '../utils/common_utils.dart';

class BaseApiService {
  final BuildContext _context;

  const BaseApiService(this._context);

  BuildContext get context => _context;

  ApiClient get client => ApiClient.instance;

  static int _noOfApiCalls = 0;

  Future<T?> callApi<T>(Future<T> request, {bool doShowLoader = true}) async {
    try {
      if (_noOfApiCalls == 0 && !ConnectivityUtils.instance.hasInternet && doShowLoader) {
        Timer.run(() => CommonUtils.showNoInternetDialog());
      }
      if (doShowLoader && ConnectivityUtils.instance.hasInternet) _showLoader(context);
      var response = await request;
      if (doShowLoader && ConnectivityUtils.instance.hasInternet) _hideLoader(context);
      return response;
    } on DioError catch (error) {
      if (doShowLoader) _hideLoader(context);
      AppLogger.log("callApi => DioError :: request -> ${error.requestOptions.uri}");
      AppLogger.log("callApi => DioError :: ${error.type} -> ${error.message}");
      switch (error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          break;
        case DioErrorType.response:
          _onHttpError(context, error);
          break;
        case DioErrorType.cancel:
          break;
        case DioErrorType.other:
          rethrow;
      }
    } on SocketException catch (socketException) {
      if (doShowLoader) _hideLoader(context);
      AppLogger.log("callApi => SocketException :: $socketException");
    } catch (error) {
      if (doShowLoader) _hideLoader(context);
      AppLogger.log("callApi :: $error");
    }
    return null;
  }

  static void _showLoader(BuildContext context) {
    if (_noOfApiCalls == 0) LoadingDialog.instance.show();
    _noOfApiCalls++;
  }

  static void _hideLoader(BuildContext context) {
    _noOfApiCalls--;
    if (_noOfApiCalls == 0) LoadingDialog.instance.dismiss();
  }

  static void _onHttpError(BuildContext context, DioError error) {
    final json = error.response?.data;
    switch (error.response?.statusCode) {
      case 500: // ServerError
      case 400: // BadRequest
      case 403: // Unauthorized
      case 404: // NotFound
      case 409: // Conflict
      case 423: // Blocked
      case 402: // Payment required
        if (json is Map<String, dynamic> && json['message'] != null) {
          CommonUtils.showErrorDialog(json['message']);
        }
        break;
      case 422: // InValidateData
        if (json is Map<String, dynamic>) {
          if (json['errors'] == null) {
            if (json['message'] != null) CommonUtils.showErrorDialog(json['message']);
          } else {
            String errors = "";
            (json['errors'] as Map<String, dynamic>).forEach((k, v) {
              errors += "• $v\n";
            });
            CommonUtils.showErrorDialog(errors);
          }
        }
        break;
      case 401: // Unauthenticated
        ApiClient.dio.clear();
        AppPref.clear();
        Navigator.of(context).pushNamedAndRemoveUntil(AppRoute.loginScreen, (route) => false);
        break;
      case 426: // ForceUpdate
        break;
      case 503:
        return CommonUtils.showErrorDialog(S.current.somethingWentWrong);
      case 524: // ServerTimeout
      case 521: // Web server is down debugPrint
      default:
        return CommonUtils.showErrorDialog(S.current.somethingWentWrong);
    }
  }
}
