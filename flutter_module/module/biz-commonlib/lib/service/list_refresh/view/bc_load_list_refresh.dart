import 'package:common_lib/components/index.dart';
import 'package:common_lib/index.dart';
import 'package:common_lib/service/list_refresh/view/bc_list_refresh.dart';
import 'package:flutter/material.dart';
export 'bc_list_view_config.dart';
import 'package:common_lib/service/list_refresh/view/bc_list_view_config.dart';

class BcLoadListRefresh<T> extends StatefulWidget {
  final ListRefreshBloc<T> listRefreshBloc;
  final ListRefreshBuilder<T> listRefreshBuilder;
  final XyListViewConfig? xyListViewConfig;
  final bool wantKeepAlive;
  final bool isNeedRefresh;

  const BcLoadListRefresh({
    required this.listRefreshBloc,
    required this.listRefreshBuilder,
    super.key,
    this.xyListViewConfig,
    this.wantKeepAlive = true,
    this.isNeedRefresh = true,
  });

  @override
  BcLoadListRefreshState<T> createState() => BcLoadListRefreshState<T>();
}

class BcLoadListRefreshState<T> extends BaseState<BcLoadListRefresh<T>>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocLoadContainer(
      loadBloc: widget.listRefreshBloc.loadBloc,
      child: BcListRefresh<T>(
        listRefreshBuilder: widget.listRefreshBuilder,
        listRefreshBloc: widget.listRefreshBloc,
        xyListViewConfig: widget.xyListViewConfig,
        isNeedRefresh: widget.isNeedRefresh,
      ),
      reload: () => widget.listRefreshBloc.init(),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.listRefreshBloc.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => widget.wantKeepAlive;
}
