import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/common/util/colors_config.dart';
import 'package:flutter_module/routes/routes.dart';
import 'package:todo_flutter/todo_app.dart';
import 'package:todo_flutter/todo_flutter.dart';

import 'common/util/native_messenger.dart';

void main() {
  runZonedGuarded(() async {
    Env.env = Env.release;
    CustomFlutterBinding();

    ///添加全局生命周期监听类
    PageVisibilityBinding.instance.addGlobalObserver(AppLifecycleObserver());
    WidgetsFlutterBinding.ensureInitialized();
    await PreferencesUtil.init();
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    // return FlutterBoostApp(AppRouter.routeFactory, initialRoute: '/',
    //     appBuilder: (Widget home) {
    //       return home;
    //     });

    runApp(
      RefreshConfiguration(
        hideFooterWhenNotFull: true,
        headerBuilder: () => const MaterialClassicHeader(),
        footerBuilder: () => ClassicFooter(
          canLoadingText: '松手以加载更多',
          failedText: '加载失败，请点击重试',
          idleText: '上拉加载更多',
          loadingText: '加载中...',
          noDataText: '暂无更多数据',
          textStyle: TextStyle(
            color: ColorsConfig.ffcccccc,
            fontSize: 12,
          ),
        ),
        child: FlutterBoostApp(
          AppRouter.routeFactory,
          initialRoute: '/',
          appBuilder: (Widget home) {
            return TodoApp(
              designSize: const Size(375, 812),
              home: home,
              theme: ThemeData(
                brightness: Brightness.light,
                scaffoldBackgroundColor: Color(0xFFFFFFFF), //Color(0xFFFFFFFF),
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                scaffoldBackgroundColor: Color(0xFF000000),
              ),
            );
          },
        ),
      ),
    );

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
class CustomFlutterBinding extends WidgetsFlutterBinding
    with BoostFlutterBinding {}

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
