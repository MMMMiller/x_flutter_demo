import 'dart:io';
import 'package:common_lib/common/api.dart';
import 'package:common_lib/index.dart';
import 'package:common_lib/service/startConfig/model/app_start_config_entity.dart';
import 'package:common_lib/service/package_info/package_info_service.dart';
class AppStartConfigeRequest extends BaseRequest<AppStartConfigEntity> {
  AppStartConfigeRequest();
  @override
  RequestBean get requestBean => RequestBean(
    Api.startConfig,
    params: {
      'appId':2, // 1 crm 2 cms
      'versionNum': packInfoService.version,
      'currentInnerNum': packInfoService.realBuildNumber,
      'systemType': Platform.isAndroid ? 1 : 2,
    },
    requestType: RequestType.GET,
  );
}