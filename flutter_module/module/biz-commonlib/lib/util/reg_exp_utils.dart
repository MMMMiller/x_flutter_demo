class RegExpUtils {
  /// 1开头的11位手机号
  static bool isPhone(String phone) {
    String regexp = r'^(1)\d{10}$';
    RegExp regExp = new RegExp(regexp);
    return regExp.hasMatch(phone);
  }

  /// 8~16位密码、数字、大小写字母、符号至少包含三种
  static bool isPassWord(String passWord) {
    String regexp = r'(?=.*([a-zA-Z].*))(?=.*[0-9].*)[a-zA-Z0-9-*/+.~!@#$%^&*()]{8,16}$';
    RegExp regExp = new RegExp(regexp);
    return regExp.hasMatch(passWord);
  }

  ///字符串查找
  static List<int> findStr(String str, String findStr) {
    var index = 0;
    var start = 0;
    final List<int> list = [];
    while (index != -1) {
      index = str.indexOf(findStr, start);
      start = index + 1;
      if (index != -1) {
        list.add(index);
      }
    }
    return list;
  }
}
