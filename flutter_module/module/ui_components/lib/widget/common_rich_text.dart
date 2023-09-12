import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/base/base_stateful_widget.dart';

class CommonRichText extends StatefulWidget {
  final List<RichTextParams> params;
  final int maxLines;
  final TextOverflow? overflow;

  const CommonRichText(
    this.params, {
    Key? key,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  _CommonRichTextState createState() => _CommonRichTextState();
}

class _CommonRichTextState extends BaseUIState<CommonRichText> {
  List<TextSpan> _getItem() {
    List<TextSpan> list = [];
    for (var element in widget.params) {
      list.add(
        TextSpan(
          text: element.text,
          recognizer: TapGestureRecognizer()
            ..onTap = () => element.click?.call(),
          style: TextStyle(
            color: element.color,
            fontWeight: element.fontWeight,
            fontSize: sFontSize(element.size),
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: _getItem(),
      ),
      maxLines: widget.maxLines,
      overflow: widget.overflow,
    );
  }
}

class RichTextParams {
  final String text;
  final Color color;
  final double size;
  final FontWeight? fontWeight;
  final VoidCallback? click;

  RichTextParams(this.text, this.size, this.color,
      {this.fontWeight, this.click});
}
