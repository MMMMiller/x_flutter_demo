/*
 * 项目名:    x-framework
 * 包名
 * 文件名:    base_bloc
 * 创建时间:  2019-12-31 on 15:45
 * 描述:
 *
 * @author   xueml
 */
export 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:x_framework/base/base_view_to_presenter.dart';
import 'package:x_framework/service/load/bloc/bloc.dart';
import 'base_event.dart';
export 'package:flutter/foundation.dart';

abstract class BaseAppBloc<Event extends YBaseEvent, State>
    extends Bloc<Event, State> {
  BaseAppBloc(State initialState) : super(initialState);

  @override
  Stream<State> mapEventToState(
    Event event,
  ) async* {
    try {
      yield* event.applyAsync(this, state) as Stream<State>;
    } catch (_, stackTrace) {
      print(stackTrace);
      yield state;
    }
  }
}

///provider loading state service，if you need loading function
abstract class BaseLoadBloc<Event extends BaseEvent, State>
    extends BaseBloc<Event, State> {
  ViewToBloc viewToBloc;

  BaseLoadBloc(
    this.viewToBloc,
    State initialState,
  ) : super(initialState) {
    setView(viewToBloc);
  }
}

abstract class BaseBloc<Event extends BaseEvent, State>
    extends BaseAppBloc<YBaseEvent, State> {
  ViewToBloc? view;

  final LoadBloc _loadBloc = LoadBloc(InitialState());

  void setView(ViewToBloc? viewToBloc) {
    view = viewToBloc;
  }

  LoadBloc get loadBloc => _loadBloc;

  void pageLoading() {
    _loadBloc.loading();
  }

  void pageError(Exception exception) {
    _loadBloc.error(exception);
  }

  void pageSuccess() {
    _loadBloc.success();
  }

  bool isLoading() {
    return loadBloc.state is LoadingState;
  }

  @override
  Future<void> close() {
    _loadBloc.close();
    return super.close();
  }

  BaseBloc(State initialState) : super(initialState);
}
