import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:common_lib/config/env_config/index.dart';
import 'package:x_framework/provider/x_dio.dart';

abstract class BaseDio extends XDio {
  late Dio _dio;
  late BaseOptions _options;

  NetInfo get netInfo;

  BaseDio() {
    _options = BaseOptions();
    _options
      ..connectTimeout = 1000 * 30
      ..receiveTimeout = 1000 * 30
      ..contentType = Headers.jsonContentType
      ..baseUrl = netInfo.baseUrl;
    _dio = Dio()
      ..options = _options
      ..httpClientAdapter = DefaultHttpClientAdapter()
      ..interceptors.addAll(providerInterceptors);
    _updateProxy();
  }

  void _updateProxy() {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      if (netInfo.isProxy) {
        client.findProxy = (uri) => 'PROXY ${netInfo.proxyIp!}';
      }
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };
  }

  @override
  Future requestDel(String apiAddress, {Map<String, dynamic>? requestParams}) {
    return _dio.delete(apiAddress, queryParameters: requestParams);
  }

  @override
  Future requestGet(String apiAddress, {Map<String, dynamic>? requestParams}) {
    return _dio.request(apiAddress, queryParameters: requestParams);
  }

  @override
  Future requestPost(String apiAddress, {Map<String, dynamic>? requestParams}) {
    return _dio.post(apiAddress, data: FormData.fromMap(requestParams ?? {}));
  }

  @override
  Future requestPostJson(String apiAddress, {requestData}) {
    if (requestData is Map) {
      return _dio.post(apiAddress, data: json.encode(requestData));
    } else {
      return _dio.post(apiAddress, data: requestData);
    }
  }

  @override
  Future requestPut(String apiAddress, {requestData}) {
    if (requestData is Map) {
      return _dio.put(apiAddress, data: json.encode(requestData));
    } else {
      return _dio.put(apiAddress, data: requestData);
    }
  }

  List<Interceptor> get providerInterceptors;
}

class DefaultDio extends BaseDio {
  @override
  final NetInfo netInfo;

  @override
  final List<Interceptor> providerInterceptors;

  DefaultDio(this.netInfo, this.providerInterceptors);
}
