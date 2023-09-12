import 'package:bc_user_api/generated/json/base/json_convert_content.dart';
import 'package:common_lib/index.dart';

///文件名:    request
///创建时间:  2022/8/25 on 20:29
///描述:
///
///@author   YHF

abstract class UserRequest<T> extends BaseRequest<T> {
  static String key = 'UserRequest';

  @override
  String get providerKey => key;
}

class UserProviderBuilder extends CommonBaseProviderBuilder {

  final UserConverterFactory _factory = UserConverterFactory();

  @override
  XConverterFactory get converterFactory => _factory;
}

class UserConverterFactory extends BaseConverterFactory {
  @override
  M? fromJsonAsT<M>(dynamic json) {
    return JsonConvert.fromJsonAsT(json);
  }
}
