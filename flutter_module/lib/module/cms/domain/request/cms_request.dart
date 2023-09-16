
import 'package:flutter_module/common/api/api_provider.dart';
import 'package:flutter_module/module/cms/domain/model/cms_entity.dart';
import 'package:flutter_module/module/cms/domain/request/cms_api.dart';
import 'package:flutter_module/module/cms/domain/request/cms_request.dart';
import 'package:todo_flutter/src/net/base_request.dart';

class CmsRequest extends ApiRequest<CmsEntity> {
  final String? id;

  CmsRequest(this.id) : super({"id" : id});

  @override
  RequestMethod get method => RequestMethod.get;

  @override
  String get url => Api.getCms;
}

