import 'package:common_lib/index.dart';

///文件名:    sm_util
///创建时间:  2022/10/9 on 17:49
///描述:
///
///@author   xueml

class SmUtils {
  static const String _hexPrivateKey = '33353832616665303634636666643533';

  static String decrypt(String hexData) {
    return SM4.decrypt(
      data: hexData,
      key: _hexPrivateKey,
    );
  }
}
