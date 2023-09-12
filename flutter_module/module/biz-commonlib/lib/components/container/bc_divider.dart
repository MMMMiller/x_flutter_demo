import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';

class BcDivider extends BaseStatelessWidget {
  BcDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: sWidth(2),
      color: ThemeUtil.getDividerColor(context),
    );
  }
}
