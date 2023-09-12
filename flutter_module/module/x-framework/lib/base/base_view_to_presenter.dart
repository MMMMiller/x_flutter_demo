
mixin ViewToBloc {
  void showLoadingDialog({String? msg});

  void dismissDialog();

  void toast(String s);

  bool isShowLoading();

  void sendEventToView(ViewEvent event);
}

abstract class ViewEvent {}
