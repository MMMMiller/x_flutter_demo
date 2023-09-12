import 'package:common_lib/index.dart';

///文件名:    mixin_will_pop
///创建时间:  2022/11/1 on 10:04
///描述:
///
///@author   xueml

mixin WillPopMixin {
  DateTime? lastPressed;

  ToastFuture? _toast;

  Future<bool> willPop() {
    if (lastPressed == null ||
        DateTime.now().difference(lastPressed!) > const Duration(seconds: 2)) {
      //两次点击间隔超过2秒则重新计时
      _toast = showToastCommon('再按一次退出');
      lastPressed = DateTime.now();
      return Future.value(false);
    }
    _toast?.dismiss();
    return Future.value(true);
  }
}
