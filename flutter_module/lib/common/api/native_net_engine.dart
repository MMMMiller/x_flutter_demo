/// projectName: exiaodian_flutter
/// createTime: 2023/9/18 on 21:24
/// fileName: native_net_engine
/// desc:
///
/// @author xueml

import 'dart:convert';

import 'package:native_net_flutter_kit/native_net_flutter_kit.dart';
import 'package:todo_flutter/todo_flutter.dart';

class NativeNetEngine extends BaseNetEngine {
  late final NativeNetFlutterKit _plugin;

  NativeNetEngine(String baseUrl) : super(baseUrl) {
    _plugin = NativeNetFlutterKit();
  }

  @override
  Future<Result> get(String url, {Map<String, dynamic>? params}) async {
    Map<String, dynamic> response = await _plugin.get(url, params: params);
    return Result(
      _convertResponse(response['data']?.toString()),
      response['code'],
      response['message'],
    );
  }

  @override
  Future<Result> post(String url, {Map<String, dynamic>? params}) async {
    Map<String, dynamic> response = await _plugin.post(url, params: params);
    return Result(
      _convertResponse(response['data']?.toString()),
      response['code'],
      response['message'],
    );
  }

  @override
  Future<Result> postJson(String url, {Map<String, dynamic>? params}) async {
    Map<String, dynamic> response = await _plugin.postJson(url, params: params);
    return Result(
      _convertResponse(response['data']?.toString()),
      response['code'],
      response['message'],
    );
  }

  @override
  Future<Result> del(String url, {Map<String, dynamic>? params}) async {
    Map<String, dynamic> response = await _plugin.del(url, params: params);
    return Result(
      _convertResponse(response['data']?.toString()),
      response['code'],
      response['message'],
    );
  }

  @override
  Future<Result> put(String url, {Map<String, dynamic>? params}) async {
    Map<String, dynamic> response = await _plugin.put(url, params: params);
    return Result(
      _convertResponse(response['data']?.toString()),
      response['code'],
      response['message'],
    );
  }

  @override
  void setConnectTimeout(Duration timeout) {}

  @override
  void setReceiveTimeout(Duration timeout) {}

  @override
  void setProxy(String ip, int port) {}

  Map? _convertResponse(String? response) {
    if (response == null) {
      return null;
    }
    return json.decode(response);
  }
}
