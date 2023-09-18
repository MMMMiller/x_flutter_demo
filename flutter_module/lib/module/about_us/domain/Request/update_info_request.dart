import 'package:flutter_module/common/api/api_provider.dart';
import 'package:flutter_module/module/about_us/domain/Request/about_us_api.dart';
import 'package:flutter_module/module/about_us/domain/model/update_info_entity.dart';
import 'package:todo_flutter/todo_flutter.dart';

///文件名:    user_info_request
///创建时间:  2022/9/13 on 15:57
///描述:
///
///@author   xueml

class UpdateInfoRequest extends ApiRequest<UpdateInfoEntity> {
  final String channelCode;
  final String platform;
  final String tenantAppId;
  final String version;

  UpdateInfoRequest(
      this.channelCode, this.platform, this.tenantAppId, this.version)
      : super({
          'channelCode': channelCode,
          'platform': platform,
          'tenantAppId': tenantAppId,
          'version': version,
        });

  @override
  RequestMethod get method => RequestMethod.get;

  @override
  String get url => Api.versionInfo;
}

class T {}
