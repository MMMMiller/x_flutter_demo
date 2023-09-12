///文件名:    mixin_js_invoke
///创建时间:  2022/10/28 on 19:31
///描述:
///
///@author   xueml
///
///

import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:common_lib/index.dart';
import 'package:common_lib/service/upload_file/upload_file_bloc.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


mixin JsInvokeMixin <T extends StatefulWidget> on BaseBlocState<T> {
  final String suffix = 'window.eventHub';

  WebViewController? get  webViewController;

  Future<void>? evaluateJavascript(String callBackId, String params) {
    final info = "$suffix['$callBackId']($params)";
    return webViewController?.runJavascript(info);
  }

  late StreamSubscription _subscription;

  late String callbackId;
  late XFile xFile;

  @override
  void initState() {
    super.initState();
    injectBloc(UploadFileBloc()..setView(this));
    _subscription = uploadFileBloc.stream.listen((event) async {
      if (event is UploadingSuccessState) {
        await evaluateJavascript(
          callbackId,
          json.encode({
            'fileUrl': event.url,
            'fileName': xFile.name,
          }),
        );
      }
    });
  }

  UploadFileBloc get uploadFileBloc => getBc<UploadFileBloc>();

  void uploadFile(XFile file, String callbackId) {
    this.callbackId = callbackId;
    xFile = file;
    uploadFileBloc.uploadFile(File(file.path));
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
