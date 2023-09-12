
import 'package:common_lib/index.dart';
import 'package:flutter_module/module/cms/domain/model/cms_entity.dart';
import 'package:flutter_module/module/cms/domain/request/cms_api.dart';
import 'package:flutter_module/module/cms/domain/request/cms_request.dart';

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

