import 'package:bc_user_api/main.dart';
import 'package:bc_user_api/model/employee_detail_entity.dart';
export 'package:bc_user_api/main.dart';
import 'package:bc_user_api/model/index.dart';
import 'package:bc_user_api/model/user_info_entity.dart';
import 'package:bc_user_module/common/request.dart';
import 'package:bc_user_module/common/user_sp.dart';
import 'package:bc_user_module/domain/bloc/user_info/user_center_bloc.dart';
import 'package:bc_user_module/router/bc_module_route.dart';
import 'package:common_lib/base/src/base_module_provider.dart';
import 'package:common_lib/index.dart';
import 'package:common_lib/persistence/src/provider_service.dart';

class UserModule extends BaseModule {
  UserModule() {
    init();
  }

  void init() {
    ProviderService.addProvider(UserRequest.key, UserProviderBuilder());
    BcCustomerModuleRoute.initRoute();
    UserCenterBloc.instance.loadLocalUser();
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
