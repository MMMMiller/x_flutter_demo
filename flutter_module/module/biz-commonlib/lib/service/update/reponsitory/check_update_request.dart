import 'dart:io';

import 'package:common_lib/common/api.dart';
import 'package:common_lib/index.dart';
import 'package:common_lib/service/update/model/app_update_entity.dart';

///文件名:    check_update_request
///创建时间:  2022/10/26 on 17:01
///描述:
///
///@author   xueml

class CheckUpdateRequest extends BaseRequest<AppUpdateEntity> {
  final String currentInnerNum;

  CheckUpdateRequest(this.currentInnerNum);

  @override
  RequestBean get requestBean => RequestBean(
        Api.checkUpdateVersion,
        params: {
          'appId': 2,
          'currentInnerNum': currentInnerNum,
          'systemType': Platform.isAndroid ? 1 : 2,
        },
        requestType: RequestType.GET,
      );
}
