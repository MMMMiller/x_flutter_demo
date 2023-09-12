
import 'package:common_lib/index.dart';
import 'package:common_lib/service/list_refresh/index.dart';
import 'package:flutter_module/domain/model/cms_entity.dart';
import 'package:flutter_module/generated/json/base/json_convert_content.dart';

class GetCmsRequest extends CmsRequest<CmsEntity> {
  final String? id;

  GetCmsRequest(this.id);

  @override
  RequestBean get requestBean => RequestBean(
        Api.getCms,
        params: {
          'id': id,
        },
        requestType: RequestType.GET,
      );
}


class Api {
  static const String getCms = '/api/v1/product/configure/c/page/detail/publish';
  static const String productList = '/api/v1/client/product/c/publish/record/page';
  static const String servicePackList = '/api/v1/client/product/c/servicePackage/getByIdSortList';
}


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
