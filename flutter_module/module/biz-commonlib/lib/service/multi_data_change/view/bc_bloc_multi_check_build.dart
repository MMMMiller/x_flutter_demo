import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';
import 'package:common_lib/service/multi_data_change/bloc/bloc.dart';
export 'package:common_lib/service/multi_data_change/bloc/bloc.dart';

class BcMultiBlocCheckBuild<T> extends StatelessWidget {
  final BlocWidgetBuilder<BcMultiCheckState<T>> builder;
  final BcMultiCheckBloc<T> bloc;

  const BcMultiBlocCheckBuild({
    required this.builder,
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BcMultiCheckBloc<T>, BcMultiCheckState<T>>(
      builder: builder,
      bloc: bloc,
    );
  }
}
