import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:pessa_flow/network/api_client.dart';
import 'package:pessa_flow/utils/app_logger.dart';
import 'package:pessa_flow/utils/connectivity_utils.dart';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';


class CacheInterceptor extends InterceptorsWrapper {
  static const _uuid = Uuid();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!ConnectivityUtils.instance.hasInternet) {
      if (options.method.toUpperCase() == "GET") {
        /*var response = await getCachedResponse(options);
        if (response != null) {
          handler.resolve(response);
          return;
        }*/
        handler.reject(DioError(requestOptions: options, type: DioErrorType.cancel, error: "No Internet"));
        return;
      }
      handler.reject(DioError(requestOptions: options, type: DioErrorType.cancel, error: "No Internet"));
      return;
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async{
    if (err.type == DioErrorType.other && err.message.contains("SocketException")) {
      /*if (err.requestOptions.method.toUpperCase() == "GET") {
        var response = await getCachedResponse(err.requestOptions);
        if (response != null) {
          handler.resolve(response);
          return;
        }
      }*/
    }
    super.onError(err, handler);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.data is ResponseBody) {
      handler.next(response);
      return;
    }

    super.onResponse(response, handler);
  }

}
