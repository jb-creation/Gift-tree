import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pessa_flow/model/model.dart';
import 'package:pessa_flow/network/api_client.dart';
import 'package:pessa_flow/network/api_urls.dart';
import 'package:pessa_flow/pref/app_pref.dart';
import 'package:pessa_flow/utils/app_logger.dart';

import 'encryption.dart';

class RefreshTokenInterceptor extends InterceptorsWrapper {
  Dio previousDio;
  Dio refreshDio = Dio(BaseOptions(contentType: "application/json", responseType: ResponseType.json));

  RefreshTokenInterceptor(this.previousDio);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (ApiClient.doWriteLog) {
      AppLogger.log("DioError :: ${err.requestOptions.method} -> ${err.requestOptions.uri}");
      AppLogger.log("DioError :: ${err.type} -> ${err.message} -> ${err.response}");
    }
    if (err.type == DioErrorType.response) {
      var previousOptions = err.requestOptions;
      if (err.response?.statusCode == 401) {
        if (!AppPref.isLogin) {
          handler.next(DioError(type: DioErrorType.cancel, requestOptions: err.requestOptions));
        } else {
          previousDio.lock();
          previousDio.interceptors.requestLock.lock();
          previousDio.interceptors.responseLock.lock();
          previousDio.interceptors.errorLock.lock();
          try {
            if (err.requestOptions.headers["Authorization"] == "Bearer " + AppPref.userToken) {
              var options = Options(headers: {"Refreshtoken": AppPref.refreshToken});
              Response responseRefresh = await refreshDio.get(ApiUrl.refreshTokenUrl, options: options);
              var encryptResp = EncryptData.fromJson(responseRefresh.data);
              var decrypted = Encryption.instance.decryption(encryptResp);
              var decryptedData = jsonDecode(decrypted);
              AppPref.userToken = decryptedData["access_token"];
              AppPref.refreshToken = decryptedData["refresh_token"];
            }
            previousDio.unlock();
            previousDio.interceptors.requestLock.unlock();
            previousDio.interceptors.responseLock.unlock();
            previousDio.interceptors.errorLock.unlock();

            var previousData = previousOptions.data;
            if (previousData is Map && previousData.isNotEmpty) {
              var encryptedData = EncryptData.fromJson(previousData);
              previousData = Encryption.instance.decryptionMobileSide(encryptedData);
              previousData = jsonDecode(previousData);
              previousOptions.data = previousData;
            }
            previousOptions.headers["Authorization"] = "Bearer " + AppPref.userToken;
            var resp = await previousDio.fetch(previousOptions);
            handler.resolve(resp);
          } on DioError catch (dioError) {
            if (dioError.response?.statusCode == 401) {
              AppPref.isLogin = false;
            }
            if (ApiClient.doWriteLog) {
              AppLogger.log(
                  "REFRESH_TOKEN DIO_ERROR :: ${dioError.requestOptions.method} -> ${dioError.requestOptions.uri}");
              AppLogger.log(
                  "REFRESH_TOKEN DIO_ERROR :: ${dioError.type} -> ${dioError.message} -> ${dioError.response}");
            }
            handler.next(dioError);
            previousDio.unlock();
            previousDio.interceptors.requestLock.unlock();
            previousDio.interceptors.responseLock.unlock();
            previousDio.interceptors.errorLock.unlock();
          } catch (error) {
            AppLogger.log("REFRESH_TOKEN ERROR :: $error");
            handler.next(err);
            previousDio.unlock();
            previousDio.interceptors.requestLock.unlock();
            previousDio.interceptors.responseLock.unlock();
            previousDio.interceptors.errorLock.unlock();
          }
        }
      } else {
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }
}
