import 'package:todo_flutter/todo_flutter.dart';

/// createTime: 2023/4/24 on 17:37
/// desc:
///
/// @author azhon
class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    LogUtil.e('BeLifeBlocObserver：[${bloc.runtimeType}]-> $error');

    dismissLoading();
    if (bloc is! BaseBloc) {
      return;
    }

    if (error is DomainException) {
      bloc.loadError(error);
    } else {
      bloc.loadError(UnknownException(error.toString()));
    }
    if (error is ApiException) {
      showToast(error.entity.message ?? '系统错误');
    } else if (error is NetworkException) {
      showToast('系统错误');
    } else {
      showToast(error.toString());
    }
  }
}
