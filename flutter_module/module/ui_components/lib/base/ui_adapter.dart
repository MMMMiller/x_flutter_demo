/*
 * 项目名:    todo_flutter
 * 包名       
 * 文件名:    ui_adapter
 * 创建时间:  2021/9/17 on 18:53
 * 描述:
 *
 * @author   阿钟
 */
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin UIAdapter {
  /// 屏幕 宽
  double get screenWidth => ScreenUtil().screenWidth;

  /// 屏幕 高
  double get screenHeight => ScreenUtil().screenHeight;

  ///状态栏高度
  double get statusBarHeight => ScreenUtil().statusBarHeight;

  double sFontSize(double size) {
    return size.sp;
  }

  double sHeight(double width) {
    return width.w;
  }

  double sWidth(double width) {
    return width.w;
  }

  double sRadius(double radius) {
    return radius.w;
  }
}
