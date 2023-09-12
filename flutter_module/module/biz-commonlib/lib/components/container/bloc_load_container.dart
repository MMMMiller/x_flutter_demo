import 'package:common_lib/index.dart';
import 'package:common_lib/util/bc_image_path.dart';
import 'package:flutter/material.dart';

class BlocLoadContainer extends BaseStatelessWidget {
  final Widget child;
  final LoadBloc loadBloc;
  final VoidCallback reload;
  final ErrorBuilder? errorBuilder;
  final Widget? loadingWidget;

  BlocLoadContainer({
    required this.child,
    required this.loadBloc,
    required this.reload,
    this.errorBuilder,
    this.loadingWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return XBlocLoadView(
      isInitLoading: true,
      loadingWidget: loadingWidget ??
          Center(
              child: CircularProgressIndicator(
            color: ThemeUtil.getPrimaryColor(context),
          )),
      loadBloc: loadBloc,
      errorBuilder: (Exception ex) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonImage(
                asset: BcCommonImage.icDefaultSearchEmpty,
                width: 150,
                height: 140,
              ),
              sizedBox(height: 10),
              CommonClickWidget(
                singleClick: reload.call,
                child: CommonText(
                  '重新加载',
                  color: ColorsConfig.primaryColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      },
      child: child,
    );
  }
}
