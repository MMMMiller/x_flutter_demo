import 'package:common_lib/generated/json/base/json_convert_content.dart';
import 'package:common_lib/index.dart';
import 'package:common_lib/service/list_refresh/index.dart';

///文件名:    request
///创建时间:  2022/8/25 on 20:29
///描述:
///
///@author   xueml

abstract class BizCommonRequest<T> extends BaseRequest<T> {
  static String key = 'BizCommonRequest';

  @override
  String get providerKey => key;
}

abstract class BizCommonBaseListRequest<T> extends ListRefreshProvider<T> {
  BizCommonBaseListRequest(super.mRequestBean);

  @override
  String get providerKey => BizCommonRequest.key;
}

class BizCommonProviderBuilder extends CommonBaseProviderBuilder {
  final BizCommonConverterFactory _factory = BizCommonConverterFactory();

  @override
  XConverterFactory get converterFactory => _factory;
}

class BizCommonConverterFactory extends BaseConverterFactory {
  @override
  M? fromJsonAsT<M>(dynamic json) {
    return JsonConvert.fromJsonAsT(json);
  }
}
