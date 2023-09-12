

import 'package:common_lib/components/dialog/bc_tip_confirm_widget.dart';
import 'package:common_lib/index.dart';
import 'package:common_lib/service/list_refresh/list_refresh_bloc.dart';
import 'package:common_lib/service/router/common_router.dart';
import 'package:common_lib/service/router/router_util.dart';

class YDefaultBlocDelegate extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    _dealBlocError(bloc, error);
    if (error is DomainException) {
      Log.e('$error===$bloc');
      handlerDomainError(error);
    } else if (error is ServiceException || error is DioError) {
      _dealNetError(error);
      Log.e('$error===$bloc==$stackTrace');
    }
  }

  void _dealNetError(error) {
    if (error is DioError) {
      final statusCode = error.response?.statusCode;
      if (statusCode == 401) {
        Toast.showToast(error.response?.data?.toString() ?? '登录状态失效，请重新登录');
      } else {
        Toast.showToast('网络错误，请稍后重试');
      }
    } else {
      Toast.showToast('网络错误，请稍后重试');
    }
  }

  void _dealBlocError(BlocBase bloc, Object error) {
    if (bloc is BaseBloc) {
      if (bloc.isLoading()) {
        if (error is FormatException) {
          bloc.pageError(error);
        } else {
          bloc.pageError(Exception('Error'));
        }
      }
      if (!isEmpty(bloc.view)) {
        if (bloc.view!.isShowLoading()) {
          bloc.view!.dismissDialog();
        }
      }
    }
    if (bloc is ListRefreshBloc) {
      bloc
        ..loadMoreFail()
        ..refreshFail();
    }
  }

  void handlerDomainError(DomainException error) {
    if (error.code == 401) {
      // 登录失效，清除用户token
      // UserCenterBloc.instance.cleanUserInfo();
      if (!SmartDialog.config.isExistDialog) {
        SmartDialog.show(
          clickMaskDismiss: false,
          builder: (_) {
            return BcTipConfirmWidget(
              showCancel: false,
              title: '提示',
              content: '登录失效，请重新登录',
              confirmText: '确定',
              onConfirm: () {
                RouterUtil.instance
                    .build(CommonRouterNames.loginPage)
                    .navigate();
                SmartDialog.dismiss();
              },
            );
          },
        );
      }
    } else {
      Toast.showToast(error.message);
    }
  }
}
