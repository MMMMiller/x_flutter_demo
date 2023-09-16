///文件名:    show_private_tip_dialog
///创建时间:  2022/10/19 on 15:15
///描述:
///
///@author   YHF

import 'package:extended_text/extended_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter/todo_flutter.dart';

class DownloadAppDialog extends StatefulWidget {
  final Function onClose;

  const DownloadAppDialog({
    super.key,
    required this.onClose,
  });

  @override
  State<StatefulWidget> createState() => DownloadAppDialogState();
}

class DownloadAppDialogState extends BaseState<DownloadAppDialog> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              print('');
            },
            child: Icon(Icons.abc,size: 100,),
          ),
          SizedBox(height: 16,),
          CommonClickWidget(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                size: 24,
                color: Colors.white,
              )),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
