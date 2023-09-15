
import 'package:todo_flutter/todo_flutter.dart';

///文件名:    user_sp
///创建时间:  2022/8/26 on 16:12
///描述:
///
///@author   xueml

class UserSp {
  static const _tokenKey = 'token';
  static const _userIdKey = 'userId';
  static const _accountKey = 'account';
  static const _passwordKey = 'password';
  static const _deviceIdKey = 'deviceId';

  static void setUserId(String userId) {
    PreferencesUtil.putString(_userIdKey, userId);
  }

  static void setToken(String token) {
    PreferencesUtil.putString(_tokenKey, token);
  }

  static void setDeviceId(String deviceId) {
    PreferencesUtil.putString(_deviceIdKey, deviceId);
  }

  static void setAccount(String token) {
    PreferencesUtil.putString(_accountKey, token);
  }

  static void setPassword(String token) {
    PreferencesUtil.putString(_passwordKey, token);
  }

  static void removeToken() {
    PreferencesUtil.remove(_tokenKey);
  }

  static void removeUserId() {
    PreferencesUtil.remove(_userIdKey);
  }

  static void removeAccount() {
    PreferencesUtil.remove(_accountKey);
  }

  static void removePassword() {
    PreferencesUtil.remove(_passwordKey);
  }

  static String get userId => PreferencesUtil.getString(_userIdKey);

  static String get token => PreferencesUtil.getString(_tokenKey);

  static String get account => PreferencesUtil.getString(_accountKey);

  static String get password => PreferencesUtil.getString(_passwordKey);

  static String get deviceId => PreferencesUtil.getString(_deviceIdKey);
}
