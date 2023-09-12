import 'package:flutter/cupertino.dart';

class XyListViewConfig {
  final Widget? emptyWidget;
  final bool enablePullUp;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;

  final bool enablePullDown;

  XyListViewConfig({
    this.emptyWidget,
    this.enablePullUp = true,
    this.scrollController,
    this.scrollPhysics,
    this.enablePullDown = true,
  });
}
