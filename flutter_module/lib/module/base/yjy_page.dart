
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/common/util/colors_config.dart';
import 'package:todo_flutter/todo_flutter.dart';

/// projectName: flutter_module
/// createTime: 2023/9/15 on 14:47
/// fileName: yjy_page
/// desc:
///
/// @author xueml



abstract class YjyPage<T extends StatefulWidget> extends BaseBlocState<T>
    with UIAdapter {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: yjyBuild(context),
      navigationBar: CupertinoNavigationBar(
      middle: CommonText(
        pageName??'',
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      leading: GestureDetector(
        onTap: () {
          // BoostNavigator.instance.pop();
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: ColorsConfig.ff333333,
        ),
      ),
    ),);
  }

  Widget yjyBuild(BuildContext context);

  Color? get pageBgColor => null;

  String? get pageName => null;
}

abstract class YjyKeepAlivePage<T extends StatefulWidget> extends YjyPage<T>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: CommonText(pageName??''),),
      child: Container(
        color: pageBgColor ?? Colors.white,
        child: yjyBuild(context),
      ),
    );
  }

  Color? get pageBgColor => null;

  @override
  bool get wantKeepAlive => true;
}
