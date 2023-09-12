import 'package:flutter/material.dart';
import 'package:ui_components/index.dart';

class CommonLoadingDialog extends Dialog with UIAdapter {
  final String? msg;

  const CommonLoadingDialog({Key? key, this.msg})
      : super(key: key, insetPadding: EdgeInsets.zero);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      constrainedAxis: Axis.vertical,
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            width: sWidth(100),
            height: sWidth(100),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0x4D000000),
                borderRadius: BorderRadius.circular(sRadius(16))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(color: Colors.white),
                const SizedBox(height: 20),
                CommonText(
                  msg ?? '加载中...',
                  color: Colors.white,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
