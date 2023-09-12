/*
 * 项目名:    feng-go-app
 * 包名
 * 文件名:    image_create
 * 创建时间:  2020/10/21 on 2:24 PM
 * 描述:
 *
 * @author   xueml
 */

import 'dart:io';
import 'package:intl/intl.dart';

Future<void> main() async {
  var result = 'class BcCommonImage {\n';
  final directory = Directory('assets/images');
  //列出所有文件，不包括链接和子文件夹
  final Stream<FileSystemEntity> entityList =
      directory.list(recursive: false, followLinks: false);
  await for (final FileSystemEntity entity in entityList) {
    if (entity.path.endsWith('.png') &&
        FileSystemEntity.isFileSync(entity.path)) {
      final fileName = entity.path.split('/').last;
      final name = fileName.split('.')[0];
      result += "\tstatic const ${toUpperCase(name)} = 'packages/common_lib/${entity.path}';\n";
    }
  }
  result += '}';
  File.fromUri(
    Uri.parse('${Uri.base}lib/util/bc_image_path.dart'),
  ).writeAsStringSync(result);
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
