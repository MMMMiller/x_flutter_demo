import 'package:bc_user_api/model/agreement_info_entity.dart';
import 'package:bc_user_api/model/employee_detail_entity.dart';
import 'package:bc_user_api/model/user_info_entity.dart';
import 'package:bc_user_module/common/user_sp.dart';
import 'package:bc_user_module/domain/bloc/device/device_bloc.dart';
import 'package:bc_user_module/domain/request/user_info_request.dart';
import 'package:bc_user_module/main.dart';
import 'package:common_lib/index.dart';

part 'user_center_event.dart';
part 'user_center_state.dart';

class UserCenterBloc extends BaseAppBloc<UserCenterEvent, UserCenterState> {
  static UserCenterBloc get instance => _getInstance();
  static UserCenterBloc? _instance;
  final DataChangeBloc<AgreementInfoEntity> agreementBloc =
  DataChangeBloc(data: null);

  static UserCenterBloc _getInstance() {
    _instance ??= UserCenterBloc();
    return _instance!;
  }

  UserCenterBloc() : super(UserCenterInitial(null));

  String? get userId => UserSp.userId;

  bool get isLogin => userId != null;

  void refreshUserInfo() {
    if (isLogin) {
      add(RefreshUserInfoEvent());
    }
  }

  void cleanUserInfo() {
    UserSp.removeToken();
    UserSp.removeUserId();
    userModuleProvider.sendMsg(LoginOutModuleMessage());
  }

  void loadLocalUser() {
    if (isLogin) {
      add(LoadLocalUserInfoEvent());
    }
  }
}
