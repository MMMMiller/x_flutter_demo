/*
 * 项目名:    flutter_x_framework_test
 * 包名       provider
 * 文件名:    x_base_provider
 * 创建时间:  2020/9/18 on 4:03 PM
 * 描述:
 *
 * @author   xueml
 */

import 'package:dio/dio.dart';
import 'package:x_framework/provider/x_dio.dart';

import 'x_converter_factory.dart';
import 'x_local_storage.dart';
import 'x_log.dart';

abstract class XBaseProviderBuilder {
  ///本地缓存
  XLocalStorage get localStorage;

  ///数据转换工厂
  XConverterFactory get converterFactory;

  ///日志
  XLog get log;

  XDio? get dio => _dio;

  ///网络提供者
  XDio? _dio;

  void setDio(XDio dio) {
    _dio = dio;
  }
}
