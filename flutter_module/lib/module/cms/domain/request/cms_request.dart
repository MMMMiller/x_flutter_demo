
import 'package:common_lib/index.dart';
import 'package:common_lib/service/list_refresh/index.dart';
import 'package:flutter_module/generated/json/base/json_convert_content.dart';

///文件名:    request
///创建时间:  2022/8/25 on 20:29
///描述:
///
///@author   xueml


abstract class CmsRequest<T> extends BaseRequest<T> {
  static String key = 'CMSRequest';

  @override
  String get providerKey => key;
}

abstract class CmsBaseListRequest<T> extends ListRefreshProvider<T> {
  CmsBaseListRequest(super.mRequestBean);

  @override
  String get providerKey => CmsRequest.key;
}

class CmsProviderBuilder extends CommonBaseProviderBuilder {
  final CmsConverterFactory _factory = CmsConverterFactory();

  @override
  XConverterFactory get converterFactory => _factory;
}

class CmsConverterFactory extends BaseConverterFactory {
  @override
  M? fromJsonAsT<M>(dynamic json) {
    return JsonConvert.fromJsonAsT(json);
  }
}