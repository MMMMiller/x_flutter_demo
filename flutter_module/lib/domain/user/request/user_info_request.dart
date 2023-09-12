
import 'package:common_lib/index.dart';
import 'package:flutter_module/common/user/api.dart';
import 'package:flutter_module/common/user/request.dart';
import 'package:flutter_module/common/user/user_sp.dart';
import 'package:flutter_module/domain/user/model/employee_detail_entity.dart';

///文件名:    user_info_request
///创建时间:  2022/9/13 on 15:57
///描述:
///
///@author   xueml

class UserInfoRequest extends UserRequest<EmployeeDetailEntity> {
  @override
  RequestBean get requestBean => RequestBean(
        Api.userCurrentDetail,
        isCacheLocal: true,
        params: {
          'id': UserSp.userId,
        },
        requestType: RequestType.GET,
      );
}
