part of 'password_manager_bloc.dart';

abstract class PasswordManagerState extends Equatable {
  const PasswordManagerState();
}

class PasswordManagerInitial extends PasswordManagerState {
  @override
  List<Object> get props => [];
}
