part of 'user_center_bloc.dart';

abstract class UserCenterState {
  final EmployeeDetailEntity? userInfoEntity;

  UserCenterState(this.userInfoEntity);
}

class UserCenterInitial extends UserCenterState {
  UserCenterInitial(super.userInfoEntity);
}
