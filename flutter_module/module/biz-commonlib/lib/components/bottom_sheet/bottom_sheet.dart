import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

const double _kButtonHeight = 56.0;

void showTel(BuildContext context,{required String phoneNum}) async {
  List<Widget> actions = [];

  actions.add(
    _map_item(
      child: Text('拨打电话：$phoneNum'),
      onPressed: () async {
        String url = 'tel:' + phoneNum;
        Navigator.of(context).pop();
          if (await canLaunchUrl(Uri.parse(url))) {

            await launchUrl(Uri.parse(url));
          }
      },
    ),
  );

  actions.add(
    _map_item(
      child: Text('取消'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
  );
  actions.add(Container(
      color: Colors.white, height: MediaQuery.of(context).padding.bottom)
  );

  return showModalBottomSheet(
    backgroundColor: Color(0x000000),
    isScrollControlled: true,
    context: context,
    builder: (_) {
      return SafeArea(
        bottom: true,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          height: (actions.length -2) * _kButtonHeight + 76,
          child: Column(children: actions),
        ),
      );
    },
  );
}

void chooseImage(BuildContext context,{required Function cameraEvent ,required Function photoEvent}) async {
  List<Widget> actions = [];

  actions.add(
    _map_item(
      child: Text('拍照'),
      onPressed: () async {
        Navigator.of(context).pop();
        print("拍照");
        cameraEvent.call();
      },
    ),
  );
  actions.add(
    _map_item(
      child: Text('相册'),
      onPressed: () async {
        Navigator.of(context).pop();
        print("相册");
        photoEvent.call();
      },
    ),
  );

  // actions.add(Container(
  //     color: Colors.white, height: MediaQuery.of(context).padding.bottom)
  // );

  actions.add(
    _map_item(
      child: Text('取消'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
  );
  actions.add(Container(
      color: Colors.white, height: MediaQuery.of(context).padding.bottom));



  return showModalBottomSheet(
    backgroundColor: Color(0xff99ff),
    isScrollControlled: true,
    context: context,
    builder: (_) {
      return SafeArea(
        bottom: true,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          height: (actions.length -2) * _kButtonHeight + 56,
          child: Column(children: actions),
        ),
      );
    },
  );
}

void saveImage(BuildContext context,{Function? saveEvent,Function? cancelEvent}) async {
  List<Widget> actions = [];

  actions.add(
    _map_item(
      child: Text('保存图片'),
      onPressed: () async {
        Navigator.of(context).pop();
        saveEvent?.call();
      },
    ),
  );

  actions.add(
    _map_item(
      child: Text('取消'),
      onPressed: () {
        Navigator.of(context).pop();
        cancelEvent?.call();
      },
    ),
  );

  actions.add(Container(
      color: Colors.white, height: MediaQuery.of(context).padding.bottom));



  return showModalBottomSheet(
    backgroundColor: Color(0xff99ff),
    isScrollControlled: true,
    context: context,
    builder: (_) {
      return SafeArea(
        bottom: true,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          height: (actions.length -2) * _kButtonHeight + 76,
          child: Column(children: actions),
        ),
      );
    },
  );
}

_map_item({required Widget child, required Function onPressed}) {
  return GestureDetector(
    onTap: () {
      onPressed.call();
    },
    behavior: HitTestBehavior.opaque,
    child: ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: _kButtonHeight,
      ),
      child: Semantics(
        button: true,
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 10.0,
            ),
            child: child),
      ),
    ),
  );
}
