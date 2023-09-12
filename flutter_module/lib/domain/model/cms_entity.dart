
import 'dart:convert';

import 'package:flutter_module/generated/json/base/json_field.dart';
import 'package:flutter_module/generated/json/cms_entity.g.dart';

@JsonSerializable()
class CmsEntity {
  int? auditStatus;
  String? channel;
  String? code;
  int? componentVersion;
  int? componentVersionPublished;
  String? createTime;
  String? creatorId;
  String? creatorName;
  String? description;
  String? editorId;
  String? editorName;
  String? id;
  int? isIndex;
  int? isLogin;
  int? listingStatus;
  String? name;
  CmsPageComponent? pageComponent;
  CmsPageSetting? pageSetting;
  String? shareDescription;
  CmsShareImg? shareImg;
  String? shareTitle;
  int? status;
  List<String>? suitableOrgList;
  int? type;
  String? updateTime;

  CmsEntity();

  factory CmsEntity.fromJson(Map<String, dynamic> json) =>
      $CmsEntityFromJson(json);

  Map<String, dynamic> toJson() => $CmsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CmsPageComponent {
  String? createTime;
  String? creatorId;
  List<dynamic>? data;
  String? id;
  String? pageId;
  CmsPageComponentPageSetting? pageSetting;
  int? version;

  CmsPageComponent();

  factory CmsPageComponent.fromJson(Map<String, dynamic> json) =>
      $CmsPageComponentFromJson(json);

  Map<String, dynamic> toJson() => $CmsPageComponentToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CmsPageComponentDataExtendInfo {
  double? mb;
  double? mr;
  double? mt;
  double? ml;

  CmsPageComponentDataExtendInfo();

  factory CmsPageComponentDataExtendInfo.fromJson(Map<String, dynamic> json) =>
      $CmsPageComponentDataExtendInfoFromJson(json);

  Map<String, dynamic> toJson() => $CmsPageComponentDataExtendInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CmsPageComponentPageSetting {
  String? backgroundColor;

  CmsPageComponentPageSetting();

  factory CmsPageComponentPageSetting.fromJson(Map<String, dynamic> json) =>
      $CmsPageComponentPageSettingFromJson(json);

  Map<String, dynamic> toJson() => $CmsPageComponentPageSettingToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CmsPageSetting {
  String? backgroundColor;

  CmsPageSetting();

  factory CmsPageSetting.fromJson(Map<String, dynamic> json) =>
      $CmsPageSettingFromJson(json);

  Map<String, dynamic> toJson() => $CmsPageSettingToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CmsShareImg {
  String? name;
  String? url;

  CmsShareImg();

  factory CmsShareImg.fromJson(Map<String, dynamic> json) =>
      $CmsShareImgFromJson(json);

  Map<String, dynamic> toJson() => $CmsShareImgToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
