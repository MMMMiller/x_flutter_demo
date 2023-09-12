/*
 * 项目名:    cacart_flutter
 * 包名
 * 文件名:    icon_create_util
 * 创建时间:  2019/2/15 on 2:23 PM
 * 描述:
 *
 * @author   xueml
 */

import 'dart:io';

import 'package:intl/intl.dart';

void main() {
  var result = """
import 'package:flutter/widgets.dart';

class CommonIcon {
    CommonIcon._();
""";
  final file = File.fromUri(Uri.parse('assets/iconfont/iconfont.css'));
  final read = file.readAsStringSync();

  final split = read.split('.icon');
  split.forEach((str) {
    if (str.contains('before')) {
      var split = str.split(":");
      result += "    static const IconData " +
          toUpperCase(split[0].replaceAll("-", "_").replaceFirst("_", "")) +
          " =  IconData(" +
          split[2].replaceAll("\"\\", "0x").split("\"")[0] +
          ", fontFamily: \'BcIcon\', fontPackage: \'common_lib\');\n";
    }
  });
  result += '}';
  var fileOut = File.fromUri(
    Uri.parse('${Uri.base}lib/util/common_icon.dart'),
  );
  fileOut.writeAsStringSync(result);
}

String toUpperCase(String text) {
  final split = text.split('_');
  String s = '';
  for (final value in split) {
    if (split.indexOf(value) != 0) {
      final beginningOfSentenceCase = toBeginningOfSentenceCase(value);
      s += beginningOfSentenceCase ?? '';
    } else {
      s += value;
    }
  }
  return s;
}
