
import 'package:common_lib/index.dart';
import 'package:flutter_module/common/user/request.dart';
import 'package:flutter_module/domain/user/model/login_info_entity.dart';

import '../../../common/user/api.dart';

class LoginRequest extends UserRequest<LoginInfoEntity> {
  final String username;
  final String password;

  LoginRequest(this.username, this.password);

  @override
  RequestBean get requestBean => RequestBean(
        Api.login,
        params: {
          'username': username,
          'password': password,
          'terminalType': '4'
        },
      );
}
class LogoutRequest extends UserRequest<LoginInfoEntity> {

  final String equipmentId;
  final String token;

  LogoutRequest(this.equipmentId, this.token);

  @override
  RequestBean get requestBean => RequestBean(
    Api.logout,
    params: {
      'equipmentId': equipmentId,
      'token':token,
    },
  );
}
