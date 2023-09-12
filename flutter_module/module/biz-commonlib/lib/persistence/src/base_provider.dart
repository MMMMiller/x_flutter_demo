import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:x_framework/base/base_net_entity.dart';
import 'package:x_framework/net/exception/exception.dart';
import 'package:x_framework/net/request_bean.dart';
import 'package:x_framework/provider/x_base_provider.dart';
import 'package:x_framework/provider/x_base_provider_builder.dart';
import 'package:x_framework/provider/x_converter_factory.dart';
import 'package:x_framework/provider/x_dio.dart';
import 'package:x_framework/util/index.dart';

abstract class XyBaseProvider<T> extends XBaseProvider<T> {
  XConverterFactory get converterFactory =>
      xBaseProviderBuilder.converterFactory;

  @override
  XBaseProviderBuilder get xBaseProviderBuilder;

  @override
  Future<BaseNetEntity<T>> load() async {
    final dio = _getXDio();
    if (dio == null) {
      throw PersistenceException('请配置XDio');
    }
    _log('request',
        'Api：${requestBean.requestUrl}----RequestParams：${json.encode(requestBean.requestParams)}');
    var data;
    switch (requestBean.requestType) {
      case RequestType.GET:
        data = await dio.requestGet(
          requestBean.requestUrl,
          requestParams: requestBean.requestParams,
        );
        break;
      case RequestType.POST_FORM:
        data = await dio.requestPost(
          requestBean.requestUrl,
          requestParams: requestBean.requestParams,
        );
        break;
      case RequestType.DEL:
        data = await dio.requestDel(
          requestBean.requestUrl,
          requestParams: requestBean.requestParams,
        );
        break;
      case RequestType.POST_JSON:
        data = await dio.requestPostJson(
          requestBean.requestUrl,
          requestData: requestBean.requestParams,
        );
        break;
      case RequestType.PUT:
        data = await dio.requestPut(
          requestBean.requestUrl,
          requestData: requestBean.requestParams,
        );
        break;
    }
    print('request Api：${requestBean.requestUrl}----RequestParams：${json.encode(requestBean.requestParams)}');
    print("响应数据 data = $data");
    return _transformData(data);
  }

  Future<BaseNetEntity<T>> _transformData(data) {
    BaseNetEntity<T> transformData;
    transformData = converterFactory.transformData<T>(data);
    if (isEmpty(transformData)) {
      throw PersistenceException('数据转换错误');
    }
    _log('transformData', 'transformType is ${T.toString()}');
    _cacheToLocal(json.encode(data.data['data']));
    return Future.value(transformData);
  }

  _log(String event, String info) {
    xBaseProviderBuilder.log
        .logI('ProviderLog===>Event is {$event},Info is {$info}');
  }

  void _cacheToLocal(String jsonMessage) {
    if (isLocalCache) {
      _log('cacheToLocal', jsonMessage);
      localStorage.saveJsonMessage(localCacheKey, jsonMessage);
    }
  }

  XDio? _getXDio() {
    return xBaseProviderBuilder.dio;
  }

  @override
  Future<T?> loadLocal() async {
    final localInfo = await localStorage.getLocalInfo(localCacheKey);
    if (localInfo == null) {
      return null;
    }
    final map = {
      'code': 200,
      'message': 'localCache_${T.toString()}',
      'data': json.decode(localInfo.cacheInfo)
    };
    final data = converterFactory.transformData<T>(
        Response(data: map, requestOptions: RequestOptions(path: '')));
    return data.data;
  }
}
