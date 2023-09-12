import 'package:flutter/material.dart';
import 'package:common_lib/base/src/base_biz_ui_mixin.dart';
import 'package:common_lib/index.dart';

///文件名:    bc_page
///创建时间:  2022/9/5 on 16:21
///描述:
///
///@author   xueml

abstract class BcPage<T extends StatefulWidget> extends BaseBlocState<T>
    with UIAdapter, BaseBizUiMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bcAppBar,
      body: CommonContainer(
        color: bcPageBgColor ?? Colors.white,
        child: bcBuild(context),
      ),
    );
  }

  Widget bcBuild(BuildContext context);

  Color? get bcPageBgColor => null;

  PreferredSizeWidget? get bcAppBar => null;
}

abstract class BcStatelessWidget extends BaseStatelessWidget
    with BaseBizUiMixin {
  BcStatelessWidget({super.key});
}

abstract class BcKeepAlivePage<T extends StatefulWidget> extends BcPage<T>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: bcAppBar,
      body: CommonContainer(
        color: bcPageBgColor ?? Colors.white,
        child: bcBuild(context),
      ),
    );
  }

  Color? get bcPageBgColor => null;

  @override
  bool get wantKeepAlive => true;
}
