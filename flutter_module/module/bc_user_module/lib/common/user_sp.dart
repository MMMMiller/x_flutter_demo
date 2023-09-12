import 'package:common_lib/index.dart';

///文件名:    user_sp
///创建时间:  2022/8/26 on 16:12
///描述:
///
///@author   YHF

class UserSp {
  static const _tokenKey = 'token';
  static const _userIdKey = 'userId';
  static const _accountKey = 'account';
  static const _passwordKey = 'password';
  static const _deviceIdKey = 'deviceId';

  static void setUserId(String userId) {
    SharedPreferencesUtil.putString(_userIdKey, userId);
  }

  static void setToken(String token) {
    SharedPreferencesUtil.putString(_tokenKey, token);
  }

  static void setDeviceId(String deviceId) {
    SharedPreferencesUtil.putString(_deviceIdKey, deviceId);
  }

  static void setAccount(String token) {
    SharedPreferencesUtil.putString(_accountKey, token);
  }

  static void setPassword(String token) {
    SharedPreferencesUtil.putString(_passwordKey, token);
  }

  static void removeToken() {
    SharedPreferencesUtil.remove(_tokenKey);
  }

  static void removeUserId() {
    SharedPreferencesUtil.remove(_userIdKey);
  }

  static void removeAccount() {
    SharedPreferencesUtil.remove(_accountKey);
  }

  static void removePassword() {
    SharedPreferencesUtil.remove(_passwordKey);
  }

  static String? get userId => SharedPreferencesUtil.getString(_userIdKey);
  static String? get token => SharedPreferencesUtil.getString(_tokenKey);
  static String? get account => SharedPreferencesUtil.getString(_accountKey);
  static String? get password => SharedPreferencesUtil.getString(_passwordKey);
  static String? get deviceId => SharedPreferencesUtil.getString(_deviceIdKey);
}
