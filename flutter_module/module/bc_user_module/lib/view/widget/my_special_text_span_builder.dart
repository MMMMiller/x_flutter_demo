import 'package:common_lib/config/color_config.dart';
import 'package:extended_text_library/extended_text_library.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MySpecialTextSpanBuilder extends SpecialTextSpanBuilder {
  final TextStyle? mTextStyle;

  MySpecialTextSpanBuilder({
    this.mTextStyle,
  });

  @override
  SpecialText? createSpecialText(String flag,
      {TextStyle? textStyle,
      SpecialTextGestureTapCallback? onTap,
      int? index}) {
    if (flag == '') {
      return null;
    }
    if (isStart(flag, DollarText.flag)) {
      return DollarText(mTextStyle ?? textStyle, onTap,
          start: index! - (DollarText.flag.length - 1));
    }
    return null;
  }
}

class DollarText extends SpecialText {
  DollarText(TextStyle? textStyle, SpecialTextGestureTapCallback? onTap,
      {this.start})
      : super(flag, flag, textStyle, onTap: onTap);
  static const String flag = '\$';
  final int? start;

  @override
  InlineSpan finishText() {
    final String text = getContent();

    return SpecialTextSpan(
        text: text,
        actualText: toString(),
        start: start!,

        ///caret can move into special text
        deleteAll: true,
        style: textStyle?.copyWith(color: ColorsConfig.primaryColor),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            if (onTap != null) {
              onTap!(toString());
            }
          });
  }
}
