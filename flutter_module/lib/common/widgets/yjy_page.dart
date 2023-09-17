
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/config/util/colors_config.dart';
import 'package:flutter_thrio/flutter_thrio.dart';
import 'package:todo_flutter/todo_flutter.dart';

/// projectName: flutter_module
/// createTime: 2023/9/15 on 14:47
/// fileName: yjy_page
/// desc:
///
/// @author xueml


abstract class BasePage<T extends StatefulWidget> extends BaseBlocState<T>
    with UIAdapter {
  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
      middle: CommonText(
        pageName??'',
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      leading: GestureDetector(
        onTap: (){
          ThrioNavigator.pop();
        },
        child: const Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: ColorsConfig.ff333333,
        ),
      ),
    ),
      child: baseBuild(context),);

  Widget baseBuild(BuildContext context);

  Color? get pageBgColor => null;

  String? get pageName => null;
}

