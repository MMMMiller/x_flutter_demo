/// createTime: 2021/9/17 on 21:12
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:ui_components/base/base_stateful_widget.dart';

class CommonClickWidget extends StatefulWidget {
  final Widget child;
  final GestureTapCallback? singleClick;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  final int clickInterceptInterval;

  const CommonClickWidget({
    required this.child,
    Key? key,
    this.onTap,
    this.onLongPress,
    this.singleClick, this.clickInterceptInterval = 1000,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CommonClickState();
  }
}

class _CommonClickState extends BaseUIState<CommonClickWidget> {
  int _lastClick = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: widget.child,
      onLongPress: () => widget.onLongPress?.call(),
      onTap: () => _interceptClick(widget.clickInterceptInterval),
    );
  }

  ///重复多次点击截流处理
  void _interceptClick(int clickInterceptInterval) {
    int nowTime = DateTime.now().millisecondsSinceEpoch;
    if ((nowTime - _lastClick).abs() > clickInterceptInterval) {
      if (widget.singleClick != null) {
        widget.singleClick!.call();
      } else {
        widget.onTap?.call();
      }
      _lastClick = nowTime;
    } else {
      widget.onTap?.call();
    }
  }
}
