import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/common/util/color_util.dart';
import 'package:flutter_module/common/util/native_messenger.dart';
import 'package:todo_flutter/todo_flutter.dart';

class AppRootPage extends StatefulWidget {
  const AppRootPage({Key? key}) : super(key: key);

  @override
  _AppRootPage createState() => _AppRootPage();
}

class _AppRootPage extends BaseState<AppRootPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        final bool canPop = ModalRoute.of(context)?.canPop ?? false;
        if (!canPop) {
          BoostNavigator.instance.pop();
        }
        return Future.value(canPop);
      },
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Flutter页面1212'),
        ),
        child: Stack(
          children: [
            Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => {
                      // BoostNavigator.instance
                      //     .push('main/cms_page', withContainer: true)

                      BoostNavigator.instance
                          .push("AboutViewController", arguments: {"a": "a", "b": "a"})
                    },
                    child: Text(
                      "跳转原生关于我们页",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black45,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => {
                      BoostNavigator.instance.push(
                        'user/about_us_page',
                        withContainer: true,
                      )
                    },
                    child: Text(
                      "跳转Flutter关于我们页",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black45,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => {
                      NativeMessenger.shared().channel.invokeMethod(
                          "SendMsgToNative", {"NativeKey": "NativeValue"})
                    },
                    child: Text(
                      "给原生发消息",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black45,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 48,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => {
                      BoostNavigator.instance.push(
                        'user/login_page',
                        withContainer: true,
                      )
                    },
                    child: Text(
                      "跳转登录页",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black45,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
