///文件名:    base_request
///创建时间:  2022/8/24 on 20:45
///描述:
///
///@author   xueml

import 'package:common_lib/index.dart';
import 'provider_service.dart';

abstract class BaseRequest<T> extends XyBaseProvider<T> {

  //CommonBaseProviderBuilder标识 用于获取网络请求构建者
  String get providerKey => CommonProvider.key;

  @override
  CommonBaseProviderBuilder get yBaseProviderBuilder =>
      ProviderService.find(providerKey);
}
