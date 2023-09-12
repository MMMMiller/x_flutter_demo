/*
 * 项目名:    feng-go-app
 * 包名
 * 文件名:    worker_observer
 * 创建时间:   4/25/21
 * 描述:     TODO
 *
 * @author   xueml
 */

import 'package:flutter/material.dart';
import 'package:x_framework/base/base_view_to_presenter.dart';
import 'package:x_framework/service/index.dart';

class ViewEventObserver {
  void hookViewEvent(ViewEvent viewEvent, State state) {
    Log.i(
        'ViewEvent：event is ${viewEvent.runtimeType.toString()}，current state is ${state.runtimeType.toString()}');
  }
}
