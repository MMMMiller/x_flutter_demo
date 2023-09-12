import 'package:bc_user_module/domain/bloc/user_info/user_center_bloc.dart';
import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';

///文件名:    provider_user_info_widget
///创建时间:  2022/9/16 on 14:06
///描述:
///
///@author   YHF

typedef BlocUserBuild = Widget Function(UserCenterState state);

class ProviderUserInfoWidget extends BaseStatelessWidget {
  final BlocUserBuild userBuild;

  ProviderUserInfoWidget({required this.userBuild, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCenterBloc, UserCenterState>(
      builder: (_, state) {
        return userBuild(state);
      },
      bloc: UserCenterBloc.instance,
    );
  }
}
