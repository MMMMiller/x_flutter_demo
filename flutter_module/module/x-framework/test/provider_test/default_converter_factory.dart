/*
 * 项目名:    x_framework
 * 包名       provider_test
 * 文件名:    default_log
 * 创建时间:  2020/9/18 on 4:29 PM
 * 描述:
 *
 * @author   xueml
 */

import 'package:x_framework/base/base_net_entity.dart';
import 'package:x_framework/provider/x_converter_factory.dart';

class DefaultConverterFactory extends XConverterFactory {
  @override
  BaseNetEntity<T> transformData<T>(data) {
    return new TestData<T>(0, '', null);
  }
}

class TestData<T> extends BaseNetEntity<T> {
  TestData(int? code, String? message, T? data) : super(code, message, data);
}
