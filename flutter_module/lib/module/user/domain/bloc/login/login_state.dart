part of 'login_bloc.dart';

abstract class LoginState {
  final LoginInfoEntity? loginInfoEntity;

  const LoginState(this.loginInfoEntity);
}

class LoginInitial extends LoginState {
  LoginInitial(super.loginInfoEntity);
}
