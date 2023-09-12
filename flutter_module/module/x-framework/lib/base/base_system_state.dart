import 'package:flutter/material.dart';
import 'package:x_framework/net/exception/exception.dart';
import 'package:x_framework/util/index.dart';
import 'package:x_framework/base/base_bloc.dart';

mixin YBaseState<T extends StatefulWidget> on State<T> {
  final List<BaseAppBloc> _mList = [];

  void injectBloc(BaseAppBloc bloc) {
    _mList.add(bloc);
  }

  void injectBlocs(List<BaseAppBloc> blocList) {
    _mList.addAll(blocList);
  }

  T getBc<T extends BaseAppBloc>() {
    final list = _mList
        .where((element) => element.runtimeType.toString() == T.toString())
        .toList();
    if (isEmptyList(list)) {
      throw TransactionException(
          '${T.toString()} is null，please inject bloc object..');
    }
    return list[0] as T;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      onResume();
    });
  }

  @override
  void dispose() {
    for (final value in _mList) {
      value.close();
    }
    super.dispose();
  }

  void onResume() {}
}
