import 'package:todo_flutter/todo_flutter.dart';

/// createTime: 2022/9/28 on 11:23
/// desc:
///
/// @author azhon
class AppSp {
  static void setProxy(bool proxy) {
    PreferencesUtil.putBool('isProxy', proxy);
  }

  static bool isProxy() {
    return PreferencesUtil.getBool('isProxy');
  }

  static void setProxyIp(String ip) {
    PreferencesUtil.putString('proxyIp', ip);
  }

  static String getProxyIp() {
    return PreferencesUtil.getString('proxyIp');
  }

  static void setEnv(String env) {
    PreferencesUtil.putString('env', env);
  }

  static String getEnv() {
    return PreferencesUtil.getString('env');
  }
}
