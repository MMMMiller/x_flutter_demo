import 'package:oktoast/oktoast.dart';

class Toast {
  static void showToast(String msg) {
    showToastCommon(msg);
  }
}

ToastFuture showToastCommon(
  String msg, {
  ToastPosition? position,
}) {
  position ??= ToastPosition.center;
  return showToast(msg, position: position, radius: 4);
}
