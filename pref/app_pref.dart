import 'dart:convert';

import 'package:pessa_flow/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  // region Pref Constants
  static const _isLogin = "is_login";
  static const _userToken = "user_token";
  static const _refreshToken = "refresh_token";
  static const _isFirstTime = "is_first_time";
  static const _user = "user";
  static const _locale = "locale";
  static const _userId = "user_id";
  // endregion

  AppPref._();

  static late final SharedPreferences _preference;

  static Future<void> init() async {
    _preference = await SharedPreferences.getInstance();
  }

  static Future<bool> clear() {
    var firstTime = isFirstTime;
    return _preference.clear().whenComplete(() => isFirstTime = firstTime);
  }

  // region isLogin
  static bool get isLogin => _preference.getBool(_isLogin) ?? false;

  static set isLogin(bool value) => _preference.setBool(_isLogin, value);

  // endregion

  // region locale
  static String get locale => _preference.getString(_locale) ?? "en";

  static set locale(String value) => _preference.setString(_locale, value);

  // endregion

  // region userToken

  static String get userToken => _preference.getString(_userToken) ?? "";

  static set userToken(String value) => _preference.setString(_userToken, value);

  // endregion


  // region userToken

  static String get userId => _preference.getString(_userId) ?? "";

  static set userId(String value) => _preference.setString(_userId, value);

  // endregion

  // region refreshToken

  static String get refreshToken => _preference.getString(_refreshToken) ?? "";

  static set refreshToken(String value) => _preference.setString(_refreshToken, value);

  // endregion

  // region isFirstTime

  static bool get isFirstTime => _preference.getBool(_isFirstTime) ?? true;

  static set isFirstTime(bool value) => _preference.setBool(_isFirstTime, value);

  // endregion

  // region user

  static User? get user =>
      _preference.containsKey(_user) ? User.fromJson(jsonDecode(_preference.getString(_user)!)) : null;

  static set user(User? user) => _preference.setString(_user, jsonEncode(user?.toJson() ?? {}));

// endregion

}
