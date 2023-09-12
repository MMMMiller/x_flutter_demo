///文件名:    BcInputSearchWidget
///创建时间:  2022/9/2 on 09:58
///描述:
///
///@author   xueml

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:common_lib/index.dart';

class BcInputSearchWidget extends StatefulWidget {
  final String? placeholder;
  final ValueChanged<String>? onChange;
  final int? debounceMill;
  final bool readOnly;
  final bool autoFocus;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmitted;
  final OverlayVisibilityMode suffixMode;
  final TextEditingController? controller;

  const BcInputSearchWidget({
    super.key,
    this.placeholder,
    this.onChange,
    this.debounceMill,
    this.controller,
    this.readOnly = false,
    this.autoFocus = false,
    this.onSubmitted,
    this.suffixMode = OverlayVisibilityMode.never,
    this.textInputAction = TextInputAction.done,
  });

  @override
  State<StatefulWidget> createState() => BcInputSearchWidgetState();
}

class BcInputSearchWidgetState extends BaseState<BcInputSearchWidget> {
  Timer? _timer;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CommonInput(
      controller: _controller,
      onSubmitted: widget.onSubmitted,
      textInputAction: widget.textInputAction,
      autofocus: widget.autoFocus,
      readOnly: widget.readOnly,
      placeholder: widget.placeholder ?? '请输入',
      prefix: Padding(
        padding: only(left: 12, right: 2),
        child: Icon(
          CommonIcon.icSearch,
          size: 18,
          color: ThemeUtil.getPlaceholderColor(context),
        ),
      ),
      placeholderColor: ThemeUtil.getPlaceholderColor(context),
      onChange: (text) {
        _timer?.cancel();
        _timer = Timer(Duration(milliseconds: widget.debounceMill ?? 300), () {
          widget.onChange?.call(text);
        });
      },
      decoration: BoxDecoration(
        color: ColorsConfig.fff2f3f5,
        borderRadius: BorderRadius.circular(sRadius(100)),
      ),
      padding: symmetric(10, 4),
      suffixMode: widget.suffixMode,
      suffix: CommonClickWidget(
        onTap: () {
          _controller.text = '';
          widget.onChange?.call('');
        },
        child: Padding(
          padding: only(right: 13),
          child: const Icon(
            CommonIcon.icCloseCircleFill,
            size: 16,
            color: ColorsConfig.ff86909c,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }
}
