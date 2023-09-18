/// projectName: exiaodian_flutter
/// createTime: 2023/9/18 on 21:24
/// fileName: native_net_engine
/// desc:
///
/// @author xueml


import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_module/common/util/native_messenger.dart';
import 'package:todo_flutter/src/net/base_net_engine.dart';

class NativeNetEngine extends BaseNetEngine {
  late Dio _dio;

  NativeNetEngine(String baseUrl) : super(baseUrl) {
    _dio = Dio();
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    );
  }

  @override
  Future<Result> get(String url, {Map<String, dynamic>? params}) async {
    final result = await NativeMessenger.shared().invokeNativeNetRequest(requestUrl: url, requestType: 'GET', requestParams: params);
    final Response response =  result as Response;
    return Result(response.data, response.statusCode, response.statusMessage);
  }

  @override
  Future<Result> post(String url, {Map<String, dynamic>? params}) async {
    final result = await NativeMessenger.shared().invokeNativeNetRequest(requestUrl: url, requestType: 'POST', requestParams: params);
    final Response response =  result as Response;
    return Result(response.data, response.statusCode, response.statusMessage);
  }

  @override
  Future<Result> postJson(String url, {Map<String, dynamic>? params}) async {
    final Response response = await _dio.post<Map>(url, data: params);
    return Result(response.data, response.statusCode, response.statusMessage);
  }

  @override
  Future<Result> del(String url, {Map<String, dynamic>? params}) async {
    final Response response = await _dio.delete<Map>(url, data: params);
    return Result(response.data, response.statusCode, response.statusMessage);
  }

  @override
  Future<Result> put(String url, {Map<String, dynamic>? params}) async {
    final Response response = await _dio.put<Map>(url, data: params);
    return Result(response.data, response.statusCode, response.statusMessage);
  }

  ///设置连接超时时间
  ///[timeout]超时时间ms
  @override
  void setConnectTimeout(Duration timeout) {
    _dio.options.connectTimeout = timeout;
  }

  ///设置接收超时时间
  ///[timeout]超时时间ms
  @override
  void setReceiveTimeout(Duration timeout) {
    _dio.options.receiveTimeout = timeout;
  }

  ///设置dio代理
  ///[ip]代理ip地址
  ///[port]代理端口
  @override
  void setProxy(String ip, int port) {
    _dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.findProxy = (uri) {
          return 'PROXY $ip:$port';
        };
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      },
    );
  }

  ///添加拦截器
  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }
}