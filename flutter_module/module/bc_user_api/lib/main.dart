import 'package:bc_user_api/model/employee_detail_entity.dart';
import 'package:bc_user_api/model/login_info_entity.dart';
import 'package:common_lib/base/src/base_module_provider.dart';

abstract class IUserModuleProvider extends IModuleProvider {
  static const moduleKey = 'UserModule';

  String? get userId;

  String? get token;

  EmployeeDetailEntity? get userInfo;

  bool get isLogin => userId != null;
}

class LoginSuccessModuleMessage extends IModuleMessage {
  final LoginInfoEntity loginInfoEntity;

  LoginSuccessModuleMessage(this.loginInfoEntity);
}

class LoginOutModuleMessage extends IModuleMessage {}
