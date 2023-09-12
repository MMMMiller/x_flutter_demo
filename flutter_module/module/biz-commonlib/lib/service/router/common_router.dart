
import 'package:common_lib/components/webview/flutter_web_view_page.dart';
import 'package:common_lib/service/router/router_util.dart';

///文件名:    common_router
///创建时间:  2022/9/1 on 20:10
///描述:
///
///@author   xueml

class CommonRouterNames {
  static const webPage = '/common/webPage';
  static const flutterWebPage = '/common/flutterWebPage';
  static const loginPage = '/user/loginPage';
  static const filePreviewPage = '/common/filePreviewPage';
}

void toLoginPage() {
  RouterUtil.instance
      .build(CommonRouterNames.loginPage)
      .navigate();
}

// void toWebPage({
//   required String link,
//   required String title,
// }) {
//
//   // RouterUtil.instance
//   //     .build(CommonRouterNames.webPage)
//   //     .withString('link', link)
//   //     .withString('title', title)
//   //     .navigate();
//
//   // webPage无jsBridge通信能力，迁移到通用webView，后续观察是否有兼容问题
//   toFlutterWebPage(link: link, title: title);
// }
// void toCommontWebPage({
//   required String link,
// }) {
//   RouterUtil.instance
//       .build(CommonRouterNames.webPage)
//       .withString('link', link)
//       .navigate();
// }

// webPage

// void toFlutterWebPage({
//   required String link,
//   required String title,
// }) {
//   RouterUtil.instance
//       .build(CommonRouterNames.flutterWebPage)
//       .withString('link', link)
//       .withString('title', title)
//       .navigate();
// }

void toFilePreviewPage({
  required String filePath,
}) {
  RouterUtil.instance
      .build(CommonRouterNames.filePreviewPage)
      .withString('filePath', filePath)
      .navigate();
}

class CommonRouter {
  static void init() {
    // RouterUtil.instance.addRoute(CommonRouterNames.flutterWebPage,
    //     (Map<String, dynamic> map) {
    //   final link = map['link'];
    //   final title = map['title'];
    //   return FlutterWebViewPage(link: link, title: title);
    // });
  }
}
