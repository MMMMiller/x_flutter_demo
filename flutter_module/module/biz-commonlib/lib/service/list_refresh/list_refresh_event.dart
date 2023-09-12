part of 'list_refresh_bloc.dart';

@immutable
abstract class ListRefreshEvent<T>
    extends XBaseEvent<ListRefreshBloc<T>, ListRefreshState<T>> {
  void _checkListResult(ListRefreshBloc<T> bloc, result) {
    if (!isSuccess(result)) {
      handlerException(bloc, result);
    }
  }
}

class InitListRefreshDataEvent<T> extends ListRefreshEvent<T> {
  @override
  Stream<ListRefreshState<T>> applyAsync(
      ListRefreshBloc<T> bloc, ListRefreshState<T> currentState) async* {
    bloc.pageLoading();
    final result = await bloc.getResetListRefreshProvider().load();
    _checkListResult(bloc, result);
    final XyBaseNetEntity baseNetEntity = result as XyBaseNetEntity;
    bloc
      ..pageNumberBean = baseNetEntity.pageNumberBean
      ..pageSuccess();
    yield ListRefreshInitial<T>(baseNetEntity.data ?? []);
  }
}

class RefreshListDataEvent<T> extends ListRefreshEvent<T> {
  @override
  Stream<ListRefreshState<T>> applyAsync(
      ListRefreshBloc<T> bloc, ListRefreshState<T> currentState) async* {
    final result = await bloc.getResetListRefreshProvider().load();
    _checkListResult(bloc, result);
    final XyBaseNetEntity baseNetEntity = result as XyBaseNetEntity;
    bloc.pageNumberBean = baseNetEntity.pageNumberBean;
    bloc.refreshController.refreshCompleted();
    yield ListRefreshInitial<T>(baseNetEntity.data ?? []);
  }
}

class LoadMoreListDataEvent<T> extends ListRefreshEvent<T> {
  @override
  Stream<ListRefreshState<T>> applyAsync(
      ListRefreshBloc<T> bloc, ListRefreshState<T> currentState) async* {
    final baseNetEntity = await bloc.getLoadMoreRefreshProvider().load();
    if (!isSuccess(baseNetEntity)) {
      bloc.refreshController.loadFailed();
      handlerException(bloc, baseNetEntity);
    }
    if (isEmptyList(baseNetEntity.data!)) {
      bloc.refreshController.loadNoData();
      yield currentState;
      return;
    }
    if (_noNextPage(baseNetEntity.data!, bloc.pageSize)) {
      bloc.refreshController.loadNoData();
    } else {
      bloc.refreshController.loadComplete();
    }
    currentState.mList.addAll(baseNetEntity.data!);
    bloc.currentPageNum += 1;
    yield ListRefreshInitial<T>(currentState.mList);
  }

  bool _noNextPage(List<T> data, int pageSize) {
    return data.length < pageSize;
  }
}

class RefreshErrorEvent<T> extends ListRefreshEvent<T> {
  @override
  Stream<ListRefreshState<T>> applyAsync(
      ListRefreshBloc<T> bloc, ListRefreshState<T> currentState) async* {
    bloc.refreshController.refreshFailed();
    yield currentState;
  }
}

class LoadMoreErrorEvent<T> extends ListRefreshEvent<T> {
  @override
  Stream<ListRefreshState<T>> applyAsync(
      ListRefreshBloc<T> bloc, ListRefreshState<T> currentState) async* {
    bloc.refreshController.loadFailed();
    yield currentState;
  }
}

class ChangeListEvent<T> extends ListRefreshEvent<T> {
  final List<T> mList;

  ChangeListEvent(this.mList);

  @override
  Stream<ListRefreshState<T>> applyAsync(
      ListRefreshBloc<T> bloc, ListRefreshState<T> currentState) async* {
    yield ListRefreshInitial(mList);
  }
}
