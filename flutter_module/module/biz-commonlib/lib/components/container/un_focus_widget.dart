import 'package:flutter/material.dart';
import 'package:ui_components/base/base_stateless_widget.dart';
import 'package:ui_components/widget/common_click_widget.dart';

/// createTime: 2022/9/2 on 15:30
/// desc:
///
/// @author azhon
class UnFocusWidget extends BaseStatelessWidget {
  final Widget child;
  final List<FocusNode?>? nodes;

  UnFocusWidget({required this.child, this.nodes, super.key});

  @override
  Widget build(BuildContext context) {
    return CommonClickWidget(
      onTap: () {
        nodes?.forEach((node) {
          node?.unfocus();
        });
      },
      child: child,
    );
  }
}
