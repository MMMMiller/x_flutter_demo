import 'package:common_lib/index.dart';
import 'package:common_lib/service/multi_data_change/bloc/multi_check_bloc.dart';
import 'package:common_lib/service/multi_data_change/bloc/multi_check_state.dart';

abstract class BcMultiCheckEvent<T>
    extends YBaseEvent<BcMultiCheckBloc<T>, BcMultiCheckState<T>> {
  BcMultiCheckEvent();
}

class AddCheckDataEvent<T> extends BcMultiCheckEvent<T> {
  final dynamic data;

  AddCheckDataEvent(this.data);

  @override
  Stream<BcMultiCheckState<T>> applyAsync(
      BcMultiCheckBloc<T> bloc, BcMultiCheckState<T> currentState) async* {
    if (currentState.checkList.length >= bloc.maxCheckLength) {
      throw DomainException('当前最多可选择${bloc.maxCheckLength}项');
    }
    currentState.checkList.add(data);
    yield InitialBcMultiCheckState(currentState.checkList);
  }
}

class RemoveCheckDataEvent<T> extends BcMultiCheckEvent<T> {
  final T data;

  RemoveCheckDataEvent(this.data);

  @override
  Stream<BcMultiCheckState<T>> applyAsync(
      BcMultiCheckBloc<T> bloc, BcMultiCheckState<T> currentState) async* {
    currentState.checkList.remove(data);
    yield InitialBcMultiCheckState(currentState.checkList);
  }
}

class ChangeCheckDataEvent<T> extends BcMultiCheckEvent<T> {
  final List<T> data;

  ChangeCheckDataEvent(this.data);

  @override
  Stream<BcMultiCheckState<T>> applyAsync(
      BcMultiCheckBloc<T> bloc, BcMultiCheckState<T> currentState) async* {
    yield InitialBcMultiCheckState(data);
  }
}
