
import 'package:common_lib/base/src/base_module_provider.dart';
import 'package:common_lib/index.dart';
import 'package:common_lib/persistence/src/provider_service.dart';
import 'package:flutter_module/common/user/request.dart';
import 'package:flutter_module/common/user/user_sp.dart';
import 'package:flutter_module/domain/user/bloc/user_info/user_center_bloc.dart';
import 'package:flutter_module/domain/user/model/employee_detail_entity.dart';
import 'package:flutter_module/domain/user/model/login_info_entity.dart';

class UserModule extends BaseModule {
  UserModule() {
    init();
  }

  void init() {
    ProviderService.addProvider(UserRequest.key, UserProviderBuilder());
    // BcCustomerModuleRoute.initRoute();
    // UserCenterBloc.instance.loadLocalUser();
  }

  @override
  IModuleProvider get iModuleProvider => UserModuleProvider();

  T getProvider<T extends IModuleProvider>() {
    return iModuleProvider as T;
  }
}

UserModule userModule = ModuleManager.getM<UserModule>();

UserModuleProvider get userModuleProvider =>
    userModule.iModuleProvider as UserModuleProvider;

class UserModuleProvider extends IUserModuleProvider {
  @override
  String? get token => UserSp.token;

  @override
  String? get userId => UserSp.userId;

  @override
  EmployeeDetailEntity? get userInfo => UserCenterBloc.instance.state.userInfoEntity;
}



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
