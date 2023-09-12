import 'package:x_framework/base/base_event.dart';
import 'package:x_framework/service/check/domian/bloc/bloc.dart';

abstract class CheckEvent extends XBaseEvent<CheckBloc, CheckState> {
  CheckEvent();
}

class ChangeCheckEvent extends CheckEvent {
  final changeValue;

  ChangeCheckEvent(this.changeValue);

  @override
  Stream<CheckState> applyAsync(
      CheckBloc bloc, CheckState currentState) async* {
    yield InitialCheckState(changeValue);
  }
}
