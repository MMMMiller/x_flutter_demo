import 'package:bc_user_api/model/employee_detail_entity.dart';
import 'package:bc_user_module/common/api.dart';
import 'package:bc_user_module/common/request.dart';
import 'package:bc_user_module/common/user_sp.dart';
import 'package:common_lib/index.dart';

///文件名:    user_info_request
///创建时间:  2022/9/13 on 15:57
///描述:
///
///@author   YHF

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
