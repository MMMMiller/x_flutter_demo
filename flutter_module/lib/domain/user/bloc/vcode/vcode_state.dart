part of 'vcode_bloc.dart';

abstract class VcodeState {
  final int progress;

  VcodeState({this.progress = 0});
}

class InitialVcodeState extends VcodeState {}

class UnVcodeState extends VcodeState {}

class InVocdeState extends VcodeState {}
