import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/module/cms/widgets/navigation_bar.dart'as FB;
import 'package:flutter_module/common/util/color_util.dart';

class AppRootPage extends StatelessWidget {
  const AppRootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FB.NavigationBar(
            title: "Flutter页面",
          ),
          FB.ControllerView(
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: ()=> {
                      BoostNavigator.instance.push('main/search_page',withContainer: false)
                    },
                    child: Text(
                      "跳转搜索页",
                      style: TextStyle(
                        fontSize: 15,
                        color: ColorUtil.dynamicColor(
                          context: context,
                          light: Colors.black45,
                          dark: Colors.white,
                        ),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: 48,),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: ()=> {
                      BoostNavigator.instance.push('user/login_page',withContainer: false,)
                    },
                    child: Text(
                      "跳转登陆页",
                      style: TextStyle(
                        fontSize: 15,
                        color: ColorUtil.dynamicColor(
                          context: context,
                          light: Colors.black45,
                          dark: Colors.white,
                        ),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
