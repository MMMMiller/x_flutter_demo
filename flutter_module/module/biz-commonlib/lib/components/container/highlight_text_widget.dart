import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';

/// createTime: 2022/9/26 on 11:38
/// desc:
///
/// @author azhon
class HighlightTextWidget extends BaseStatelessWidget {
  final String name;
  final String keyword;
  final Color color;
  final Color highlightColor;
  final double fontSize;
  final FontWeight? fontWeight;

  HighlightTextWidget({
    required this.name,
    required this.keyword,
    this.fontWeight,
    this.fontSize = 14,
    this.color = ColorsConfig.ff1d2129,
    this.highlightColor = ColorsConfig.ff1966ff,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (name.isEmpty || isEmpty(keyword)) {
      return _text();
    }
    final list = RegExpUtils.findStr(name, keyword);
    if (list.isEmpty) {
      return _text();
    }
    final List<RichTextParams> params = [];
    for (var i = 0; i < list.length; i++) {
      final start = list[i];
      if (i == 0 && start != 0) {
        params.add(
          RichTextParams(
            name.substring(0, start),
            fontSize,
            color,
            fontWeight: fontWeight,
          ),
        );
      }
      final text1 = name.substring(start, start + keyword.length);
      params.add(
        RichTextParams(
          text1,
          fontSize,
          highlightColor,
          fontWeight: fontWeight,
        ),
      );
      final end = i + 1 < list.length ? list[i + 1] : name.length;
      final text2 = name.substring(start + keyword.length, end);
      params.add(
        RichTextParams(
          text2,
          fontSize,
          color,
          fontWeight: fontWeight,
        ),
      );
    }
    return CommonRichText(params);
  }

  Widget _text() {
    return CommonText(
      name,
      fontSize: fontSize,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
