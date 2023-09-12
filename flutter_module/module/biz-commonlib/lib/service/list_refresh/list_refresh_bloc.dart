import 'dart:async';

import 'package:common_lib/persistence/src/xy_base_net_entity.dart';
import 'package:common_lib/service/list_refresh/provider/list_refresh_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:x_framework/base/base_bloc.dart';
import 'package:x_framework/base/base_event.dart';
import 'package:x_framework/net/request_bean.dart';
import 'package:x_framework/util/index.dart';

part 'list_refresh_event.dart';

part 'list_refresh_state.dart';

typedef ListRefreshError = void Function(Exception exception);

class ListRefreshBloc<T>
    extends BaseBloc<ListRefreshEvent<T>, ListRefreshState<T>>
    with ListRefreshInterface<T> {
  late RefreshController _refreshController;

  int currentPageNum = 1;
  int pageSize;

  ListRefreshProvider<T> requestProvider;

  PageNumberBean? pageNumberBean;

  final ListRefreshError? listRefreshError;

  RefreshController get refreshController => _refreshController;

  ListRefreshBloc({
    required this.requestProvider,
    this.listRefreshError,
    this.pageSize = 10,
  }) : super(ListRefreshInitial<T>([])) {
    _initListParams();
    _refreshController = RefreshController();
  }

  ///配置私有[RefreshController]
  void setRefreshController(RefreshController refreshController) {
    _refreshController = refreshController;
  }

  RequestBean get requestBean => requestProvider.requestBean;

  void _initListParams() {
    changePageNum(1);
  }

  void resetRequestProvider(ListRefreshProvider<T> requestProvider) {
    this.requestProvider = requestProvider;
  }

  RequestBean changePageNum(int pageNum) {
    requestBean.requestParams['pageNum'] = pageNum;
    requestBean.requestParams['pageSize'] = pageSize;
    return requestBean;
  }

  @override
  void init() {
    _cleanState();
    add(InitListRefreshDataEvent<T>());
  }

  @override
  void refreshFail() {
    add(RefreshErrorEvent<T>());
  }

  @override
  void loadMoreFail() {
    add(LoadMoreErrorEvent<T>());
  }

  @override
  void refresh() {
    _cleanState();
    add(RefreshListDataEvent<T>());
  }

  @override
  void loadMore() {
    add(LoadMoreListDataEvent<T>());
  }

  @override
  void removeItem(T item) {
    state.mList.remove(item);
    add(ChangeListEvent(state.mList));
  }

  ListRefreshProvider<T> getRefreshProvider() {
    return requestProvider;
  }

  ListRefreshProvider<T> getResetListRefreshProvider() {
    changePageNum(1);
    return requestProvider;
  }

  dynamic _getCurrentPageNum() {
    if (!isEmptyMap(requestBean.requestParams)) {
      return requestBean.requestParams['pageNum'];
    }
  }

  ListRefreshProvider<T> getLoadMoreRefreshProvider() {
    var listPageNum = _getCurrentPageNum();
    changePageNum(listPageNum += 1);
    return requestProvider;
  }

  void _cleanState() {
    refreshController.resetNoData();
  }

  @override
  Future<void> close() {
    _refreshController.dispose();
    return super.close();
  }

  @override
  void addItem(T item) {
    state.mList.add(item);
    add(ChangeListEvent(state.mList));
  }

  @override
  void addFirstItem(T item) {
    state.mList.insert(0, item);
    add(ChangeListEvent(state.mList));
  }

  @override
  void clean() {
    state.mList.clear();
    add(ChangeListEvent(state.mList));
  }

  @override
  void changeList(List<T> mList) {
    add(ChangeListEvent(mList));
  }
}

mixin ListRefreshInterface<T> {
  void removeItem(T item);

  void addItem(T item);

  void addFirstItem(T item);

  void init();

  void refresh();

  void loadMore();

  void refreshFail();

  void loadMoreFail();

  void clean();

  void changeList(List<T> mList);
}
