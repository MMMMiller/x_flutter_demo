import 'dart:async';
import 'dart:io';

import 'package:common_lib/index.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/framework/service/application_service.dart';

import 'flutter_app.dart';
import 'common/util/native_messenger.dart';

void main() {
  runZonedGuarded(() async {
    Env.env = Env.release;
    CustomFlutterBinding();
    ///添加全局生命周期监听类
    PageVisibilityBinding.instance.addGlobalObserver(AppLifecycleObserver());
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPreferencesUtil.getInstance();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);

    ApplicationService.instance.init();

    runApp(FlutterApp());

    /// App.native通信员初始化
    NativeMessenger.shared();

    configureSystemUIOverlayStyle();
  }, (Object error, StackTrace stack) {
    /// 处理所有未处理的异常
    print("catch error in main() func.   $error");
    // reportErrorLog(makeErrorDetails(error, stack));
  }, zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
    parent.print(zone, "X Log: $line");
    // collectLog(line);
  }));
}

///全局生命周期监听示例
class AppLifecycleObserver with GlobalPageVisibilityObserver {
  @override
  void onBackground(Route route) {
    super.onBackground(route);
    print("AppLifecycleObserver - onBackground");
  }

  @override
  void onForeground(Route route) {
    super.onForeground(route);
    print("AppLifecycleObserver - onForground");
  }

  @override
  void onPagePush(Route route) {
    super.onPagePush(route);
    print("AppLifecycleObserver - onPagePush");
  }

  @override
  void onPagePop(Route route) {
    super.onPagePop(route);
    print("AppLifecycleObserver - onPagePop");
  }

  @override
  void onPageHide(Route route) {
    super.onPageHide(route);
    print("AppLifecycleObserver - onPageHide");
  }

  @override
  void onPageShow(Route route) {
    super.onPageShow(route);
    print("AppLifecycleObserver - onPageShow");
  }
}

///创建一个自定义的Binding，继承和with的关系如下，里面什么都不用写
class CustomFlutterBinding extends WidgetsFlutterBinding with BoostFlutterBinding {}

/// 状态栏
configureSystemUIOverlayStyle() {
  if (Platform.isAndroid) {
    /// 沉侵式状态栏
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // statusBarBrightness: Brightness.dark,
    ));
  }
  // else if (Platform.isIOS) {
  //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  // }

  /// 单页面沉侵式导航栏  AnnotatedRegion<SystemUiOverlayStyle>
  // AnnotatedRegion<SystemUiOverlayStyle>(
  //   value: SystemUiOverlayStyle.dark,
  //   child: Scaffold,
  // );
}
