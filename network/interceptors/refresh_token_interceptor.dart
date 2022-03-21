import 'dart:convert';
import 'dart:io';

import 'package:pessa_flow/model/model.dart';
import 'package:pessa_flow/network/api_client.dart';
import 'package:pessa_flow/network/api_endpoints.dart';
import 'package:pessa_flow/pref/app_pref.dart';
import 'package:pessa_flow/utils/app_logger.dart';
import 'package:dio/dio.dart';

import '../encryption.dart';

class RefreshTokenInterceptor extends InterceptorsWrapper {
  Dio previousDio;
  Dio refreshDio = Dio(BaseOptions(
    contentType: ContentType.json.mimeType,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 60000,
    sendTimeout: 60000,
  ));

  RefreshTokenInterceptor(this.previousDio);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (ApiClient.doWriteLog) {
      AppLogger.log("<-------------------------------------- DioError -------------------------------------->");
      AppLogger.log("DioError :: ${err.requestOptions.method} -> ${err.requestOptions.uri}");
      AppLogger.log("DioError :: ${err.type} -> ${err.message} -> ${err.response}");
    }
    if (err.type == DioErrorType.response) {
      var previousOptions = err.requestOptions;
      if (err.response?.statusCode == 401 && err.response?.data["isExpired"] == 1) {
        _lockPreviousRequests();
        try {
          await _refreshToken();
          _unlockPreviousRequests();
          var resp = await _fetchPreviousRequest(previousOptions);
          handler.resolve(resp);
        } on DioError catch (dioError) {
          if (dioError.response?.statusCode == 401) AppPref.isLogin = false;
          if (ApiClient.doWriteLog) {
            AppLogger.log(
                "REFRESH_TOKEN DIO_ERROR :: ${dioError.requestOptions.method} -> ${dioError.requestOptions.uri}");
            AppLogger.log(
                "REFRESH_TOKEN DIO_ERROR :: ${dioError.type} -> ${dioError.message} -> ${dioError.response}");
          }
          handler.next(dioError);
          _unlockPreviousRequests();
        } catch (error) {
          AppLogger.log("REFRESH_TOKEN ERROR :: $error");
          handler.next(err);
          _unlockPreviousRequests();
        }
      } else {
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }

  void _lockPreviousRequests() {
    previousDio.lock();
    previousDio.interceptors.requestLock.lock();
    previousDio.interceptors.responseLock.lock();
    previousDio.interceptors.errorLock.lock();
  }

  void _unlockPreviousRequests() {
    previousDio.unlock();
    previousDio.interceptors.requestLock.unlock();
    previousDio.interceptors.responseLock.unlock();
    previousDio.interceptors.errorLock.unlock();
  }

  Future<void> _refreshToken() async {
    var options = Options(headers: {
      "Authorization": AppPref.userToken,
      "isrefreshtoken": 1,
    });
    try {
      if (ApiClient.doWriteLog) {
        AppLogger.log("Request :: GET -> ${ApiEndpoints.refreshToken}");
        AppLogger.log("Headers ::");
        options.headers?.forEach((key, value) => AppLogger.log("$key: $value"));
      }
      Response response = await refreshDio.get(ApiEndpoints.refreshToken, options: options);
      if (ApiClient.doWriteLog) {
        AppLogger.log("Response :: ${response.requestOptions.method} -> ${response.requestOptions.uri}");
        AppLogger.log("Data :: ${response.data}");
      }
      if (ApiClient.doEncryption) {
        var encryptResp = EncryptData.fromJson(response.data);
        var decrypted = Encryption.instance.decryption(encryptResp);
        var decryptedData = jsonDecode(decrypted);
        if (ApiClient.doWriteLog) {
          AppLogger.log("Decrypted Data :: $decryptedData");
        }
        response.data = decryptedData;
      }
      AppPref.userToken = response.data["data"];
    } on DioError catch (error) {
      if (error.type == DioErrorType.response && error.response?.statusCode == 422) {
        return;
      } else {
        rethrow;
      }
    }
  }

  Future<Response> _fetchPreviousRequest(RequestOptions previousOptions) async {
    var previousData = previousOptions.data;
    if (previousData is Map && previousData.isNotEmpty && ApiClient.doEncryption) {
      var encryptedData = EncryptData.fromJson(previousData);
      previousData = Encryption.instance.decryptionMobileSide(encryptedData);
      previousData = jsonDecode(previousData);
      previousOptions.data = previousData;
    }
    previousOptions.headers["Authorization"] = "Bearer " + AppPref.userToken;
    var resp = await previousDio.fetch(previousOptions);
    return resp;
  }
}
