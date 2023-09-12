/*
 * 项目名:    x_framework
 * 包名
 * 文件名:    custom_provider
 * 创建时间:  2020/9/18 on 4:21 PM
 * 描述:
 *
 * @author   xueml
 */

import 'package:dio/src/dio.dart';
import 'package:x_framework/provider/x_base_provider_builder.dart';
import 'package:x_framework/provider/x_converter_factory.dart';
import 'package:x_framework/provider/x_dio.dart';
import 'package:x_framework/provider/x_local_storage.dart';
import 'package:x_framework/provider/x_log.dart';
import 'package:x_framework/service/local_storage/local_storage_service.dart';
import 'package:x_framework/service/log/x_default_log.dart';

import 'custom_cache_manager.dart';
import 'default_converter_factory.dart';
import 'default_dio.dart';

void main() {}

class CustomProvider extends XBaseProviderBuilder {

  @override
  XConverterFactory get converterFactory => DefaultConverterFactory();

  @override
  XLocalStorage get localStorage => LocalStorageService(CustomCacheManager());

  @override
  XLog get log => XDefaultLog();

  @override
  Dio initDio() {
    // TODO: implement initDio
    throw UnimplementedError();
  }


}
