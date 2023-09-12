
import 'package:common_lib/index.dart';
import 'package:flutter_module/common/user/user_sp.dart';
import 'package:flutter_module/domain/user/model/agreement_info_entity.dart';
import 'package:flutter_module/domain/user/model/employee_detail_entity.dart';
import 'package:flutter_module/domain/user/request/user_info_request.dart';
import 'package:flutter_module/pages/user/main.dart';

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
