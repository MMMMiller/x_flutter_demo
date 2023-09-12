import 'package:common_lib/index.dart';

/// createTime: 2022/9/28 on 11:23
/// desc:
///
/// @author azhon
class AppSp {
  static void setProxy(bool proxy) {
    SharedPreferencesUtil.putBool('isProxy', proxy);
  }

  static bool isProxy() {
    return SharedPreferencesUtil.getBool('isProxy') ?? false;
  }

  static void setProxyIp(String ip) {
    SharedPreferencesUtil.putString('proxyIp', ip);
  }

  static String getProxyIp() {
    return SharedPreferencesUtil.getString('proxyIp') ?? '';
  }

  static void setEnv(String env) {
    SharedPreferencesUtil.putString('env', env);
  }

  static String getEnv() {
    return SharedPreferencesUtil.getString('env') ?? '';
  }
}
