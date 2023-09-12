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
import 'domian/bloc/bloc.dart';

class XBlocCheckBuild extends StatelessWidget {
  final BlocWidgetBuilder<CheckState> builder;
  final CheckBloc checkBloc;

  const XBlocCheckBuild(
      {Key? key, required this.builder, required this.checkBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckBloc, CheckState>(
      builder: (BuildContext context, CheckState state) {
        return builder(context, state);
      },
      bloc: checkBloc,
    );
  }
}
