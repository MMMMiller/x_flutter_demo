part of 'login_bloc.dart';

abstract class LoginEvent extends BaseEvent<LoginBloc, LoginState> {
  LoginEvent();
}

class LoginByPsdEvent extends LoginEvent {
  final String name;
  final String password;
  final bool autoLogin;

  LoginByPsdEvent(this.name, this.password, this.autoLogin);

  @override
  Future<LoginState> on(LoginBloc bloc, LoginState currentState) async {
    if (ObjectUtil.isEmpty(name)) {
      throw UnknownException('请输入账户');
    }
    if (ObjectUtil.isEmpty(password)) {
      throw UnknownException('请输入密码');
    }
    showLoading();
    final baseNetEntity = await LoginRequest(name, password).request();
    isSuccess(bloc, baseNetEntity);
    bloc.saveLoginInfo(baseNetEntity.data!);
    dismissLoading();
    showToast('登录成功');
    UserSp.setAccount(name);
    UserSp.setPassword(password);
    return LoginInitial(baseNetEntity.data);
  }
}

class Logout extends LoginEvent {
  final String equipmentId;
  final String token;

  Logout(this.equipmentId, this.token);

  @override
  Future<LoginState> on(LoginBloc bloc, LoginState currentState) async {
    showLoading();
    final baseNetEntity = await LogoutRequest(equipmentId, token).request();
    isSuccess(bloc, baseNetEntity);
    dismissLoading();
    UserCenterBloc.instance.cleanUserInfo();
    return currentState;
  }
}
