/*
 * 项目名:    x_framework
 * 包名       provider_test
 * 文件名:    default_log
 * 创建时间:  2020/9/18 on 4:29 PM
 * 描述:
 *
 * @author   xueml
 */

import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:x_framework/provider/x_dio.dart';

class DefaultDio extends XDio {
  late Dio _dio;
  late BaseOptions _options;

  DefaultDio() {
    DefaultHttpClientAdapter adapter = DefaultHttpClientAdapter();
    adapter.onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };
    _dio = Dio()
      ..options = BaseOptions(
        baseUrl: 'http://mall.test.feng-go.com/api/v1/',
        connectTimeout: 15000,
        receiveTimeout: 5000,
      )
      ..httpClientAdapter = adapter;
  }

  @override
  Future requestDel(String apiAddress, {Map<String, dynamic>? requestParams}) {
    return _dio.delete(apiAddress, data: requestParams);
  }

  @override
  Future requestGet(String apiAddress, {Map<String, dynamic>? requestParams}) {
    return _dio.request(apiAddress, queryParameters: requestParams);
  }

  @override
  Future requestPost(String apiAddress, {Map<String, dynamic>? requestParams}) {
    return _dio.post(apiAddress, data: json.encode(requestParams));
  }

  @override
  Future requestPostJson(String apiAddress, {requestData}) {
    return _dio.post(apiAddress, data: json.decode(requestData));
  }

  @override
  Future requestPut(String apiAddress, {requestData}) {
    return _dio.put(apiAddress, data: json.encode(requestData));
  }
}
