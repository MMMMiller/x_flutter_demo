/*
 * 项目名:    x-framework
 * 包名
 * 文件名:    object_util_test
 * 创建时间:  2021/7/22 on 4:24 PM
 * 描述:
 *
 * @author   xueml
 */

import 'package:x_framework/util/object_util.dart';

void main() {
  String? a = null;
  Map map = {'a': 'b'};
  print(isEmptyString(a));
  print(a?.length);
  print(isEmptyMap(map));
}
