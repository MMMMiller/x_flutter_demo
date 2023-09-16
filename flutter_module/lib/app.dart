/// projectName: exiaodian_flutter
/// createTime: 2023/9/16 on 11:55
/// fileName: app
/// desc:
///
/// @author xueml

/// projectName: exiaodian_flutter
/// createTime: 2023/9/16 on 11:36
/// fileName: app
/// desc:
///
/// @author xueml

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/common/util/colors_config.dart';
import 'package:flutter_module/common/util/native_messenger.dart';
import 'package:flutter_thrio/flutter_thrio.dart';
import 'package:todo_flutter/todo_app.dart';
import 'package:todo_flutter/todo_flutter.dart';
import './module.dart';

void main() => runWith(null);

void biz1() => runWith('biz1');

void biz2() => runWith('biz2');

class MainApp extends StatefulWidget {
  const MainApp({super.key, final String entrypoint = 'main'})
      : _entrypoint = entrypoint;

  final String _entrypoint;

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    ThrioModule.init(Module(), entrypoint: widget._entrypoint,
        onModuleInitStart: (final url) {
      ThrioLogger.i('module start init: $url');
    });
  }

  @override
  Widget build(final BuildContext context) => NavigatorMaterialApp(
        transitionPage: const NavigatorHome(showRestartButton: true),
        builder: (final context, final child) => Container(
          child: child,
        ),
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }),
        ),
      );
}

runWith(String? entrypoint) async {
  Env.env = Env.release;

  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesUtil.init();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  Widget _mainApp = entrypoint == null ? MainApp() : MainApp(entrypoint: entrypoint);
  runApp(RefreshConfiguration(
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
    child: TodoApp(
      designSize: const Size(375, 812),
      home: _mainApp,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color(0xFFFFFFFF), //Color(0xFFFFFFFF),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF000000),
      ),
    ),
  ));

  /// App.native通信员初始化
  NativeMessenger.shared();

  if (Platform.isAndroid) {
    /// 沉侵式状态栏
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }
}
