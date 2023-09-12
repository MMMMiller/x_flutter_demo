part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends YBaseEvent<LoginBloc, LoginState> {
  LoginEvent();
}

class LoginByPsdEvent extends LoginEvent {
  final String name;
  final String password;
  final bool autoLogin;

  LoginByPsdEvent(this.name, this.password, this.autoLogin);

  @override
  Stream<LoginState> applyAsync(
      LoginBloc bloc, LoginState currentState) async* {
    if (isEmptyString(name)) {
      throw DomainException('请输入账户');
    }
    if (isEmptyString(password)) {
      throw DomainException('请输入密码');
    }
    bloc.view?.showLoadingDialog();
    final baseNetEntity = await LoginRequest(name, password).load();
    if (!isSuccess(baseNetEntity)) {
      handlerException(bloc, baseNetEntity);
    }
    bloc.saveLoginInfo(baseNetEntity.data!);
    bloc.view?.dismissDialog();
    bloc.view?.toast('登录成功');
    yield LoginInitial(baseNetEntity.data);
    UserSp.setAccount(name);
    UserSp.setPassword(password);

    deviceBloc.changeDeviceUser(baseNetEntity.data?.tokenExpireTime);

    await RouterUtil.instance.build(OutRouterName.mainPage).navigateClear();
  }
}
class Logout extends LoginEvent {

  final String equipmentId;
  final String token;
  Logout(this.equipmentId, this.token);

  @override
  Stream<LoginState> applyAsync(
      LoginBloc bloc, LoginState currentState) async* {
    bloc.view?.showLoadingDialog();
    final baseNetEntity = await LogoutRequest(equipmentId,token).load();
    if (!isSuccess(baseNetEntity)) {
      handlerException(bloc, baseNetEntity);
    }
    bloc.view?.dismissDialog();
    UserCenterBloc.instance.cleanUserInfo();
    await RouterUtil.instance
        .build(BcRouteName.loginPage)
        .navigateClear();
  }
}
