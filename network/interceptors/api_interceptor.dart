import 'dart:convert';

import 'package:pessa_flow/model/model.dart';
import 'package:pessa_flow/network/api_client.dart';
import 'package:pessa_flow/pref/app_pref.dart';
import 'package:pessa_flow/utils/app_logger.dart';
import 'package:dio/dio.dart';

import '../encryption.dart';

class ApiInterceptor extends InterceptorsWrapper {
  final bool doEncryption;
  final bool doWriteLog;

  ApiInterceptor({this.doEncryption = true, this.doWriteLog = true});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (AppPref.isLogin) {
      options.headers["Authorization"] = "Bearer " + AppPref.userToken;
    } else {
      options.headers["VerifyToken"] = AppPref.userToken;
    }
    if (ApiClient.doWriteLog) {
      AppLogger.log("<-------------------------------------- Request Options -------------------------------------->");
      AppLogger.log("Request :: ${options.method} -> ${options.uri}");
      AppLogger.log("Data :: ${options.data}");
      AppLogger.log("QueryParameters :: ${options.queryParameters}");
      AppLogger.log("Headers ::");
      options.headers.forEach((key, value) => AppLogger.log("$key: $value"));
    }
    if (options.data is Map<String, dynamic> && doEncryption) {
      var encrypted = Encryption.instance.encryption(jsonEncode(options.data));
      options.data = encrypted.toJson();
      if (doWriteLog) AppLogger.log("Encrypted Data :: ${options.data}");
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (doWriteLog) {
      AppLogger.log("<-------------------------------------- Response -------------------------------------->");
      AppLogger.log("Response :: ${response.requestOptions.method} -> ${response.requestOptions.uri}");
      AppLogger.log("Data :: ${response.data}");
    }
    if (response.data is Map<String, dynamic> && doEncryption) {
      var encryptResp = EncryptData.fromJson(response.data);
      var decrypted = Encryption.instance.decryption(encryptResp);
      if (doWriteLog) AppLogger.log("Decrypted :: $decrypted");
      var decryptedData = jsonDecode(decrypted);
      response.data = decryptedData;
      if (doWriteLog) AppLogger.log("Decrypted Data :: ${response.data}");
    }
    super.onResponse(response, handler);
  }
}
