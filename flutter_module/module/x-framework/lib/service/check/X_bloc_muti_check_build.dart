/*
 * 项目名:    x-framework
 * 包名
 * 文件名:    x_bloc_user_build
 * 创建时间:  2020-01-09 on 11:35
 * 描述:
 *
 * @author   xueml
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_framework/service/check/domian/bloc/muti_check_bloc/bloc.dart';

class XMutiBlocCheckBuild extends StatelessWidget {
  final BlocWidgetBuilder<MutiCheckState> builder;
  final MutiCheckBloc mutiCheckBloc;

  const XMutiBlocCheckBuild(
      {Key? key, required this.builder, required this.mutiCheckBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MutiCheckBloc, MutiCheckState>(
      builder: (BuildContext context, MutiCheckState state) {
        return builder(context, state);
      },
      bloc: mutiCheckBloc,
    );
  }
}
