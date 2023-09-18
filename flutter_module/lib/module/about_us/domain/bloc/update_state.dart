part of 'update_bloc.dart';

abstract class UpdateState {
  final UpdateInfoEntity? updateInfoEntity;

  const UpdateState(this.updateInfoEntity);
}

class UpdateInitial extends UpdateState {
  UpdateInitial(super.UpdateInfoEntity);
}
