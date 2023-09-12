/// createTime: 2021/9/29 on 10:14
/// desc:
///
/// @author azhon

import 'package:flutter/material.dart';
import 'package:ui_components/base/base_stateful_widget.dart';
import 'package:ui_components/widget/common_input.dart';
import 'package:ui_components/widget/common_text.dart';

class CommonInputArea extends StatefulWidget {
  final double? minHeight;
  final double? maxHeight;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? countPadding;
  final double? countFontSize;
  final Color? countTextColor;

  final EdgeInsetsGeometry? padding;
  final String placeholder;
  final double? placeholderFontSize;
  final Color? placeholderColor;
  final double? fontSize;
  final Color? color;
  final BoxDecoration? decoration;
  final int? maxLength;
  final int? maxLines;
  final bool autofocus;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onSubmitted;

  const CommonInputArea({
    Key? key,
    this.minHeight,
    this.maxHeight,
    this.countPadding,
    this.backgroundColor = const Color(0xFFF6F7F9),
    this.countFontSize,
    this.countTextColor,
    this.borderRadius,

    ///原本输入的属性
    this.controller,
    this.padding,
    this.placeholder = '请输入描述信息',
    this.placeholderFontSize,
    this.placeholderColor = const Color(0xFFC7CCD5),
    this.fontSize,
    this.color,
    this.decoration,
    this.maxLength,
    this.maxLines,
    this.autofocus = false,
    this.onSubmitted,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  _CommonInputAreaState createState() => _CommonInputAreaState();
}

class _CommonInputAreaState extends BaseUIState<CommonInputArea> {
  late TextEditingController _controller;
  int _inputLength = 0;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onTextChange);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: widget.minHeight ?? 0,
        maxHeight: widget.maxHeight ?? double.infinity,
      ),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius:
            widget.borderRadius ?? BorderRadius.circular(sRadius(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CommonInput(
            controller: _controller,
            padding: widget.padding ?? all(12),
            placeholder: widget.placeholder,
            placeholderColor: widget.placeholderColor,
            placeholderFontSize: widget.placeholderFontSize,
            fontSize: widget.fontSize,
            color: widget.color,
            maxLength: widget.maxLength,
            maxLines: widget.maxLines,
            autofocus: widget.autofocus,
            onSubmitted: widget.onSubmitted,
            focusNode: widget.focusNode,
            textInputAction: widget.textInputAction,
            keyboardType: widget.keyboardType,
            decoration: const BoxDecoration(),
          ),
          Visibility(
            visible: widget.maxLength != null,
            child: Padding(
              padding: widget.countPadding ?? only(right: 24, bottom: 24),
              child: CommonText(
                '$_inputLength/${widget.maxLength}',
                color: widget.countTextColor,
                fontSize: widget.countFontSize,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onTextChange() {
    setState(() {
      _inputLength = _controller.text.length;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_onTextChange);
  }
}
