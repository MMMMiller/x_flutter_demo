import 'package:common_lib/util/bc_image_path.dart';
import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// createTime: 2022/9/14 on 13:46
/// desc:
///
/// @author azhon
class BcInputLayoutWidget extends StatefulWidget {
  final String hint;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLength;
  final bool? obscureText;
  final bool? showClear;
  final TextStyle? textStyle;
  final bool showBorder;
  final VoidCallback? onEditingComplete;
  final bool autoFocus;
  final FocusNode? focusNode;
  final bool showNotice;
  final TextInputAction textInputAction;
  final FormFieldValidator? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const BcInputLayoutWidget({
    this.prefix,
    this.controller,
    this.hint = '请输入',
    this.maxLength,
    this.keyboardType,
    this.textStyle,
    this.inputFormatters,
    this.showClear = false,
    this.showNotice = false,
    this.textInputAction = TextInputAction.done,
    super.key,
    this.validator,
    this.showBorder = true,
    this.autoFocus = false,
    this.obscureText = false,
    this.suffix,
    this.onEditingComplete,
    this.focusNode,
  });

  @override
  State<StatefulWidget> createState() => BcInputLayoutWidgetState();
}

class BcInputLayoutWidgetState extends BaseState<BcInputLayoutWidget> {
  final DataChangeBloc<bool> _showTextBlock = DataChangeBloc(data: true);

  Widget _renderSuffix(DataChangeState state) {
    if (widget.obscureText!) {
      return IconTheme(
        data: IconTheme.of(context).copyWith(color: ColorsConfig.ff4e5969),
        child: CommonClickWidget(
          clickInterceptInterval: 300,
          singleClick: () {
            _showTextBlock.changeData(!state.data);
            print(widget.hint);
          },
          child: (widget.controller?.text ?? '').isEmpty
              ? SizedBox()
              : !state.data
                  ? CommonImage(
                      asset: BcCommonImage.icEyeVisible,
                      width: 16,
                      height: 16,
                    )
                  : CommonImage(
                      asset: BcCommonImage.icEyeInvisible,
                      width: 16,
                      height: 16,
                    ),
        ),
      );
    } else if (widget.showClear!) {
      return CommonClickWidget(
        clickInterceptInterval: 300,
        singleClick: () {
          widget.controller?.text = '';
          _showTextBlock.changeData(false);
        },
        child: IconTheme(
          data: IconTheme.of(context).copyWith(color: ColorsConfig.ff4e5969),
          child: (widget.controller?.text ?? '').isNotEmpty
              ? const Icon(CommonIcon.icClose,
                  color: ColorsConfig.ffc9cdd4, size: 16)
              : sizeBox(),
        ),
      );
    } else {
      return IconTheme(
        data: IconTheme.of(context).copyWith(color: ColorsConfig.ff4e5969),
        child: widget.suffix ?? sizeBox(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DataChangeWidget(
        dataChangeBloc: _showTextBlock,
        child: (BuildContext context, DataChangeState state) {
          return TextFormField(
            onChanged: (text) => {
              // 仅用于触发清除按钮的状态切换
              if (widget.showClear!) {_showTextBlock.changeData(!state.data)},
              // 仅用于触发明文、秘文icon展示状态切换
              if (widget.obscureText!) {_showTextBlock.changeData(state.data)}
            },
            buildCounter: (context,
                {required currentLength, required isFocused, maxLength}) {
              return sizedBox();
            },
            focusNode: widget.focusNode,
            controller: widget.controller,
            obscureText: widget.obscureText! ? state.data : false,
            maxLength: widget.maxLength,
            textInputAction: widget.textInputAction,
            keyboardType: widget.keyboardType,
            autofocus: widget.autoFocus,
            inputFormatters: widget.inputFormatters,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            style: widget.textStyle ??
                TextStyle(
                  fontSize: sFontSize(16),
                  color: ColorsConfig.ff4e5969,
                ),
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(
                fontSize: widget.textStyle?.fontSize ?? sFontSize(16),
                color: ColorsConfig.ffc9cdd4,
              ),
              errorStyle: TextStyle(
                fontSize: sFontSize(widget.showNotice ? 10 : 0),
                color: ColorsConfig.fff54622,
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: ColorsConfig.e1e2e8, width: sWidth(0.5)),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: ColorsConfig.e1e2e8, width: sWidth(0.5)),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: ColorsConfig.primaryColor, width: sWidth(0.5)),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: ColorsConfig.primaryColor, width: sWidth(0.5)),
              ),
              focusedBorder: widget.showBorder
                  ? UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorsConfig.primaryColor, width: sWidth(0.5)),
                    )
                  : InputBorder.none,
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: ColorsConfig.primaryColor, width: sWidth(0.5)),
              ),
              prefixIconConstraints: BoxConstraints(
                maxWidth: sWidth(32),
                maxHeight: sWidth(16),
              ),
              suffixIconConstraints: BoxConstraints(
                maxWidth: sWidth(120),
                maxHeight: sWidth(16),
              ),
              prefixIcon: widget.prefix != null
                  ? IconTheme(
                      data: IconTheme.of(context)
                          .copyWith(color: ColorsConfig.ff4e5969),
                      child: Padding(
                        padding: only(right: 16),
                        child: widget.prefix,
                      ),
                    )
                  : null,
              suffixIcon: _renderSuffix(state),
            ),
            onEditingComplete: () {
              if (widget.onEditingComplete != null) {
                widget.onEditingComplete!.call();
              }
            },
            validator: widget.validator ??
                (text) {
                  if (text == null || text.isEmpty) {
                    return widget.hint;
                  }
                  return null;
                },
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
