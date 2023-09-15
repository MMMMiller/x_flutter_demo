import 'package:flutter_module/common/api/api_provider.dart';
import 'package:flutter_module/module/user/domain/request/user_api.dart';
import 'package:flutter_module/module/user/domain/model/login_info_entity.dart';
import 'package:todo_flutter/todo_flutter.dart';

class LoginRequest extends ApiRequest<LoginInfoEntity> {
  final String username;
  final String password;

  LoginRequest(this.username, this.password)
      : super(
            {'username': username, 'password': password, 'terminalType': '4'});

  @override
  RequestMethod get method => RequestMethod.get;

  @override
  String get url => Api.login;
}

class LogoutRequest extends ApiRequest<LoginInfoEntity> {
  final String equipmentId;
  final String token;

  LogoutRequest(this.equipmentId, this.token)
      : super({
          'equipmentId': equipmentId,
          'token': token,
        });

  @override
  RequestMethod get method => RequestMethod.get;

  @override
  String get url => Api.logout;
}
