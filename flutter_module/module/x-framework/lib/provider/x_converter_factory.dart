/*
 * 项目名:    flutter_x_framework_test
 * 包名       provider
 * 文件名:    x_converter_factory
 * 创建时间:  2020/9/18 on 3:57 PM
 * 描述:
 *
 * @author   xueml
 */

import 'package:x_framework/base/base_net_entity.dart';

abstract class XConverterFactory {
 BaseNetEntity<T> transformData<T>(data);
}
