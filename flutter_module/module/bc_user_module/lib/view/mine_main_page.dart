///文件名:    mine_main_page
///创建时间:  2022/9/7 on 21:23
///描述:
///
///@author   YHF

import 'package:bc_user_module/common/user_sp.dart';
import 'package:bc_user_module/domain/bloc/user_info/user_center_bloc.dart';
import 'package:bc_user_module/domain/bloc/login/login_bloc.dart';
import 'package:bc_user_module/router/bc_route_name.dart';
import 'package:bc_user_module/router/out_router_name.dart';
import 'package:common_lib/components/app_bar/bc_app_bar.dart';
import 'package:common_lib/components/index.dart';
import 'package:common_lib/service/router/router_util.dart';
import 'package:common_lib/util/desensitization_phone.dart';
import 'package:flutter/material.dart';
import 'package:common_lib/index.dart';
import 'package:bc_user_module/view/provider_user_info_widget.dart';

class MineMainPage extends StatefulWidget {
  const MineMainPage({super.key});

  @override
  MineMainPageState createState() => MineMainPageState();
}

class MineMainPageState extends BcPage<MineMainPage> {
  LoginBloc get loginBloc => getBc<LoginBloc>();
  final DataChangeBloc<bool> _cleanState = DataChangeBloc(data: false);

  @override
  Widget bcBuild(BuildContext context) {
    return ColoredBox(
      color: ColorsConfig.fff7f8fa,
      child: paddingV16H16(
        child: Column(
          children: [
            sizeBox(height: 24),
            _renderHeader(),
            sizeBox(height: 24),
            _renderMenu(),
            const Spacer(),
            CommonText(
              '设备ID：23推5htfd',
              color: ThemeUtil.getDesColor(context),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    injectBloc(LoginBloc(this));
    UserCenterBloc.instance.refreshUserInfo();
  }

  @override
  PreferredSizeWidget? get bcAppBar => BcAppBar(
        title: '我的',
        rightWidget: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onDoubleTap: () {
            BcDialog.showVerificationDialog(context,
                onConfirm: () => RouterUtil.instance
                    .build(OutRouterName.developerPage)
                    .navigate());
          },
          child: sizeBox(width: 26, height: 26),
        ),
      );

  Widget _renderHeader() {
    return CommonContainer(
      color: Colors.white,
      padding: symmetric(24, 16),
      borderRadius: BorderRadius.circular(4),
      child: ProviderUserInfoWidget(
        userBuild: (UserCenterState state) {
          final employeeBase = state.userInfoEntity?.employeeBase;
          final employeePost = state.userInfoEntity?.employeePost;
          return Column(
            children: [
              BcAvatarImage(
                network: employeeBase?.photo,
                size: 50,
              ),
              sizeBoxH16(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(employeeBase?.name ?? '-'),
                      sizeBox(width: 8),
                      Icon(
                        employeeBase?.gender == 1
                            ? CommonIcon.icMan
                            : CommonIcon.icWoman,
                        size: 12,
                        color: employeeBase?.gender == 1
                            ? ThemeUtil.getPrimaryColor(context)
                            : Colors.redAccent,
                      ),
                    ],
                  ),
                  sizeBox(height: 6),
                  CommonText(
                    desensitization(employeeBase?.phone ?? '-'),
                    color: ThemeUtil.getDesColor(context),
                  ),
                  sizeBox(height: 12),
                  CommonText(
                    ('[${employeePost?.employeePost?.typePackage?.desc}]') +
                        (employeePost?.employeePost?.name ?? ''),
                    color: ThemeUtil.getDesColor(context),
                  ),
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
        _renderMenuItem(
          icon: CommonIcon.icUnlock,
          title: '修改密码',
          click: () {
            RouterUtil.instance.build(BcRouteName.changePwdPage).navigate();
          },
        ),
        sizeBox(height: 6),
        _renderClean(),
        sizeBox(height: 6),
        _renderMenuItem(
          icon: CommonIcon.icInteractive,
          title: '退出登录',
          click: () {
            BcDialog.showTipConfirmDialog(
              context,
              title: '确定退出账号？',
              onCancel: () => RouterUtil.instance.pop(),
              onConfirm: () {
                loginBloc.logout(UserSp.deviceId, UserSp.token);
              },
            );
          },
        ),
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
      child: CommonContainer(
        padding: symmetric(18, 16),
        child: Row(
          children: [
            Icon(
              icon,
              size: 14,
            ),
            sizeBox(width: 14),
            Expanded(
              child: CommonText(
                title,
                fontSize: 14,
                height: 1,
              ),
            ),
            const Icon(
              CommonIcon.icArrowRight,
              size: 12,
            )
          ],
        ),
      ),
    );
  }

  Widget _renderClean() {
    return DataChangeWidget<bool>(
      dataChangeBloc: _cleanState,
      child: (_, state) {
        final bool isCleaning = state.data ?? false;
        return CommonClickWidget(
          singleClick: () async {
            _cleanState.changeData(true);
            await Future.delayed(const Duration(seconds: 1));
            _cleanState.changeData(false);
            toast('清理成功');
          },
          child: CommonContainer(
            padding: symmetric(18, 16),
            child: Row(
              children: [
                Visibility(
                  visible: isCleaning,
                  child: SizedBox(
                    width: sWidth(15),
                    height: sWidth(15),
                    child: CircularProgressIndicator(
                      strokeWidth: sWidth(2),
                      color: ThemeUtil.getDesColor(context),
                    ),
                  ),
                ),
                Visibility(
                  visible: !isCleaning,
                  child: const Icon(
                    CommonIcon.icDelete,
                    size: 14,
                  ),
                ),
                sizeBox(width: 14),
                Expanded(
                  child: CommonText(
                    isCleaning ? '清理中...' : '清理加速',
                    fontSize: 14,
                    height: 1,
                  ),
                ),
                const Icon(
                  CommonIcon.icArrowRight,
                  size: 12,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
