import 'package:flutter_module/common/api/api_provider.dart';
import 'package:flutter_module/module/user/domain/request/user_api.dart';
import 'package:flutter_module/module/user/domain/request/user_sp.dart';
import 'package:flutter_module/module/user/domain/model/employee_detail_entity.dart';
import 'package:todo_flutter/todo_flutter.dart';

///文件名:    user_info_request
///创建时间:  2022/9/13 on 15:57
///描述:
///
///@author   xueml

class UserInfoRequest extends ApiRequest<EmployeeDetailEntity> {
  UserInfoRequest()
      : super({
          'id': UserSp.userId,
        });

  @override
  RequestMethod get method => RequestMethod.get;

  @override
  String get url => Api.userCurrentDetail;
}
