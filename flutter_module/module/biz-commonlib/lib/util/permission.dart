// ignore_for_file: unused_import

import 'dart:io';

import 'package:common_lib/util/theme_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:common_lib/config/color_config.dart';


class BCPermissions {
  static Future<bool> requestPermission(BuildContext context,String type) async {

    final Map<String,Permission>permissionDataMap = {
      "camera": Permission.camera,
      "photos":Platform.isIOS?Permission.photos:Permission.storage,
    };
    final permissionKey = permissionDataMap[type] as Permission;

    final Map<Permission, PermissionStatus> permissionMap = await [
      permissionKey,
    ].request();

    if(permissionMap[permissionKey] == PermissionStatus.granted || permissionMap[permissionKey] == PermissionStatus.limited){
      return true;
    }
    if(Platform.isAndroid && type == 'photos'){
      //兼容 安卓13系统 机型为VIVO iQOO neo6系列机型 相机权限授权问题
      if(permissionMap[permissionKey] == PermissionStatus.permanentlyDenied){
        final Map<Permission, PermissionStatus> permissionMap = await [
          Permission.photos,
        ].request();
        if(permissionMap[Permission.photos] == PermissionStatus.granted || permissionMap[Permission.photos] == PermissionStatus.limited){
          return true;
        }
      }
    }


    final bool? shouldRequestPermission =
    await showPermissionConfirmDialog(context, type);
    if (shouldRequestPermission != null && shouldRequestPermission) {
      return await permissionKey.request().isGranted;
    }
    return shouldRequestPermission ?? false;
  }
  //权限说明文案
  static String PermissionKeyInfo(String type){

    final Map<String,String> permissionName={
      "camera":"相机,用于拍摄照片和视频、更换头像等场景", // 1
      "photos":"相册,用于发送/保存照片和视频、上传头像等场景", // 9
    };
    return permissionName[type] as String;
  }

  static Future<bool?> showPermissionConfirmDialog(
      BuildContext context, type) async {

    void closeDialog() {
      Navigator.of(context).pop(false);
    }

    void getPermission() async {
      Navigator.of(context).pop(false);
      openAppSettings();
    }

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;

    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content:Text("$appName想访问您的${PermissionKeyInfo(type)}",style:TextStyle(
            fontSize: 17,
            color: Colors.black,
          )),
          actions: <Widget>[
            const Divider(),
            SizedBox(
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextButton(
                      child: Text("以后再说",
                          style: const TextStyle(fontSize: 17,
                              fontWeight:FontWeight.w500,
                              color: ColorsConfig.ff4e5969)),
                      onPressed: closeDialog, // 关闭对话框
                    ),
                  ),
                  const VerticalDivider(),
                  Expanded(
                    child: TextButton(
                      child: Text("去开启", style:TextStyle(
                          fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: ColorsConfig.ff1966ff,
                      )),
                      onPressed: getPermission,
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}



