import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';

class OvalNumContainer extends BaseStatelessWidget {
  final String count;
  final EdgeInsetsGeometry? padding;

  OvalNumContainer({
    required this.count,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      padding: padding ?? symmetric(0, 6),
      decoration: BoxDecoration(
        color: ColorsConfig.ff380d,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: CommonText(
          count,
          color: Colors.white,
          fontSize: 8,
          height: 1,
        ),
      ),
    );
  }
}
