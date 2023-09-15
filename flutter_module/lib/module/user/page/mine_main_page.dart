///文件名:    mine_main_page
///创建时间:  2022/9/7 on 21:23
///描述:
///
///@author   xueml

import 'package:flutter/material.dart';
import 'package:flutter_module/common/util/colors_config.dart';
import 'package:flutter_module/module/user/domain/bloc/login/login_bloc.dart';
import 'package:flutter_module/module/user/domain/bloc/user_info/user_center_bloc.dart';
import 'package:flutter_module/module/user/widget/provider_user_info_widget.dart';
import 'package:todo_flutter/todo_flutter.dart';

class MineMainPage extends StatefulWidget {
  const MineMainPage({super.key});

  @override
  MineMainPageState createState() => MineMainPageState();
}

class MineMainPageState extends BaseState<MineMainPage> {
  LoginBloc get loginBloc => getBloc<LoginBloc>();
  final DataChangeBloc<bool> _cleanState = DataChangeBloc(false);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ColorsConfig.fff7f8fa,
      child: Padding(
        padding: all(16),
        child: Column(
          children: [
            sizedBox(height: 24),
            _renderHeader(),
            sizedBox(height: 24),
            _renderMenu(),
            const Spacer(),
            CommonText(
              '设备ID：23推5htfd',
              // color: ThemeUtil.getDesColor(context),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    addBloc(LoginBloc()..setState(this));
    UserCenterBloc.instance.refreshUserInfo();
  }

  // @override
  // PreferredSizeWidget? get bcAppBar => BcAppBar(
  //       title: '我的',
  //       rightWidget: GestureDetector(
  //         behavior: HitTestBehavior.opaque,
  //         onDoubleTap: () {
  //           // BcDialog.showVerificationDialog(context,
  //           //     onConfirm: () => RouterUtil.instance
  //           //         .build(OutRouterName.developerPage)
  //           //         .navigate());
  //         },
  //         child: sizeBox(width: 26, height: 26),
  //       ),
  //     );

  Widget _renderHeader() {
    return Container(
      color: Colors.white,
      padding: symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: ProviderUserInfoWidget(
        userBuild: (UserCenterState state) {
          final employeeBase = state.userInfoEntity?.employeeBase;
          final employeePost = state.userInfoEntity?.employeePost;
          return Column(
            children: [
              CommonImage(
                network: employeeBase?.photo,
                size: 50,
              ),
              sizedBox(height: 16),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(employeeBase?.name ?? '-'),
                      sizedBox(width: 8),
                      // Icon(
                      //   employeeBase?.gender == 1
                      //       ? CommonIcon.icMan
                      //       : CommonIcon.icWoman,
                      //   size: 12,
                      //   color: employeeBase?.gender == 1
                      //       ? ThemeUtil.getPrimaryColor(context)
                      //       : Colors.redAccent,
                      // ),
                    ],
                  ),
                  sizedBox(height: 6),
                  // CommonText(
                  //   desensitization(employeeBase?.phone ?? '-'),
                  //   color: ThemeUtil.getDesColor(context),
                  // ),
                  sizedBox(height: 12),
                  // CommonText(
                  //   ('[${employeePost?.employeePost?.typePackage?.desc}]') +
                  //       (employeePost?.employeePost?.name ?? ''),
                  //   color: ThemeUtil.getDesColor(context),
                  // ),
                ],
              )
            ],
          );
        },
      ),
    );
  }

  Widget _renderMenu() {
    return Column(
      children: [
        // _renderMenuItem(
          // icon: CommonIcon.icUnlock,
          // title: '修改密码',
          // click: () {
            // RouterUtil.instance.build(BcRouteName.changePwdPage).navigate();
          // },
        // ),
        sizedBox(height: 6),
        _renderClean(),
        sizedBox(height: 6),
        // _renderMenuItem(
        //   icon: CommonIcon.icInteractive,
        //   title: '退出登录',
        //   click: () {
        //     BcDialog.showTipConfirmDialog(
        //       context,
        //       title: '确定退出账号？',
        //       onCancel: () => RouterUtil.instance.pop(),
        //       onConfirm: () {
        //         loginBloc.logout(UserSp.deviceId, UserSp.token);
        //       },
        //     );
        //   },
        // ),
      ],
    );
  }

  Widget _renderMenuItem({
    required IconData icon,
    required String title,
    required Function click,
  }) {
    return CommonClickWidget(
      singleClick: () => click(),
      child: Container(
        padding: symmetric(vertical: 18, horizontal: 16),
        child: Row(
          children: [
            Icon(
              icon,
              size: 14,
            ),
            sizedBox(width: 14),
            Expanded(
              child: CommonText(
                title,
                fontSize: 14,
                height: 1,
              ),
            ),
            // const Icon(
            //   CommonIcon.icArrowRight,
            //   size: 12,
            // )
          ],
        ),
      ),
    );
  }

  Widget _renderClean() {
    return DataChangeWidget<bool>(
      bloc: _cleanState,
      child: (_, state) {
        final bool isCleaning = state ?? false;
        return CommonClickWidget(
          singleClick: () async {
            _cleanState.changeData(true);
            await Future.delayed(const Duration(seconds: 1));
            _cleanState.changeData(false);
            showToast('清理成功');
          },
          child: Container(
            padding: symmetric(vertical: 18,horizontal: 16),
            child: Row(
              children: [
                Visibility(
                  visible: isCleaning,
                  child: SizedBox(
                    width: setWidth(15),
                    height: setWidth(15),
                    child: CircularProgressIndicator(
                      strokeWidth: setWidth(2),
                      // color: ThemeUtil.getDesColor(context),
                    ),
                  ),
                ),
                // Visibility(
                //   visible: !isCleaning,
                  // child: const Icon(
                  //   CommonIcon.icDelete,
                  //   size: 14,
                  // ),
                // ),
                sizedBox(width: 14),
                Expanded(
                  child: CommonText(
                    isCleaning ? '清理中...' : '清理加速',
                    fontSize: 14,
                    height: 1,
                  ),
                ),
                // const Icon(
                //   CommonIcon.icArrowRight,
                //   size: 12,
                // )
              ],
            ),
          ),
        );
      },
    );
  }
}
