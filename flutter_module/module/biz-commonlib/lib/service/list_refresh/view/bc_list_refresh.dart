import 'package:common_lib/components/empty/default_list_empty_widget.dart';
import 'package:common_lib/components/index.dart';
import 'package:common_lib/index.dart';
import 'package:common_lib/service/list_refresh/list_refresh_bloc.dart';
import 'package:flutter/material.dart';
import 'package:common_lib/service/list_refresh/view/bc_list_view_config.dart';
export '../list_refresh_bloc.dart';

typedef ListRefreshBuilder<T> = Widget Function(List<T> listData);

class BcListRefresh<T> extends BaseStatelessWidget {
  final ListRefreshBloc<T> listRefreshBloc;
  final ListRefreshBuilder<T> listRefreshBuilder;
  final XyListViewConfig? xyListViewConfig;
  final bool isNeedRefresh;

  BcListRefresh({
    required this.listRefreshBloc,
    required this.listRefreshBuilder,
    required this.isNeedRefresh,
    this.xyListViewConfig,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListRefreshBloc<T>, ListRefreshState<T>>(
      builder: (_, ListRefreshState<T> state) {
        return isNeedRefresh
            ? (!isEmptyList(state.mList)
                ? SmartRefresher(
                    controller: listRefreshBloc.refreshController,
                    onRefresh: listRefreshBloc.refresh,
                    onLoading: listRefreshBloc.loadMore,
                    enablePullUp: xyListViewConfig == null
                        ? _defaultXyListConfig.enablePullUp
                        : xyListViewConfig!.enablePullUp,
                    physics: xyListViewConfig?.scrollPhysics,
                    scrollController: xyListViewConfig?.scrollController,
                    enablePullDown: xyListViewConfig == null
                        ? _defaultXyListConfig.enablePullDown
                        : xyListViewConfig!.enablePullDown,
                    child: listRefreshBuilder(state.mList),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (xyListViewConfig == null
                          ? _defaultXyListConfig.emptyWidget
                          : xyListViewConfig!.emptyWidget ??
                              _defaultXyListConfig.emptyWidget)!,
                    ],
                  ))
            : listRefreshBuilder(state.mList);
      },
      bloc: listRefreshBloc,
    );
  }

  XyListViewConfig get _defaultXyListConfig => XyListViewConfig(
        emptyWidget: DefaultListEmptyWidget(
          refresh: listRefreshBloc.init,
        ),
      );
}
