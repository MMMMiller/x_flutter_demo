import 'package:flutter_module/generated/json/base/json_convert_content.dart';
import 'package:flutter_module/module/cms/domain/model/cms_entity.dart';

CmsEntity $CmsEntityFromJson(Map<String, dynamic> json) {
  final CmsEntity cmsEntity = CmsEntity();
  return cmsEntity;
}

Map<String, dynamic> $CmsEntityToJson(CmsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  return data;
}

extension CmsEntityExtension on CmsEntity {
}

CmsPageComponent $CmsPageComponentFromJson(Map<String, dynamic> json) {
  final CmsPageComponent cmsPageComponent = CmsPageComponent();
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    cmsPageComponent.createTime = createTime;
  }
  final String? creatorId = jsonConvert.convert<String>(json['creatorId']);
  if (creatorId != null) {
    cmsPageComponent.creatorId = creatorId;
  }
  final List<dynamic>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (data != null) {
    cmsPageComponent.data = data;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    cmsPageComponent.id = id;
  }
  final String? pageId = jsonConvert.convert<String>(json['pageId']);
  if (pageId != null) {
    cmsPageComponent.pageId = pageId;
  }
  final CmsPageComponentPageSetting? pageSetting = jsonConvert.convert<
      CmsPageComponentPageSetting>(json['pageSetting']);
  if (pageSetting != null) {
    cmsPageComponent.pageSetting = pageSetting;
  }
  final int? version = jsonConvert.convert<int>(json['version']);
  if (version != null) {
    cmsPageComponent.version = version;
  }
  return cmsPageComponent;
}

Map<String, dynamic> $CmsPageComponentToJson(CmsPageComponent entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['createTime'] = entity.createTime;
  data['creatorId'] = entity.creatorId;
  data['data'] = entity.data;
  data['id'] = entity.id;
  data['pageId'] = entity.pageId;
  data['pageSetting'] = entity.pageSetting?.toJson();
  data['version'] = entity.version;
  return data;
}

extension CmsPageComponentExtension on CmsPageComponent {
  CmsPageComponent copyWith({
    String? createTime,
    String? creatorId,
    List<dynamic>? data,
    String? id,
    String? pageId,
    CmsPageComponentPageSetting? pageSetting,
    int? version,
  }) {
    return CmsPageComponent()
      ..createTime = createTime ?? this.createTime
      ..creatorId = creatorId ?? this.creatorId
      ..data = data ?? this.data
      ..id = id ?? this.id
      ..pageId = pageId ?? this.pageId
      ..pageSetting = pageSetting ?? this.pageSetting
      ..version = version ?? this.version;
  }
}

CmsPageComponentDataExtendInfo $CmsPageComponentDataExtendInfoFromJson(
    Map<String, dynamic> json) {
  final CmsPageComponentDataExtendInfo cmsPageComponentDataExtendInfo = CmsPageComponentDataExtendInfo();
  final double? mb = jsonConvert.convert<double>(json['mb']);
  if (mb != null) {
    cmsPageComponentDataExtendInfo.mb = mb;
  }
  final double? mr = jsonConvert.convert<double>(json['mr']);
  if (mr != null) {
    cmsPageComponentDataExtendInfo.mr = mr;
  }
  final double? mt = jsonConvert.convert<double>(json['mt']);
  if (mt != null) {
    cmsPageComponentDataExtendInfo.mt = mt;
  }
  final double? ml = jsonConvert.convert<double>(json['ml']);
  if (ml != null) {
    cmsPageComponentDataExtendInfo.ml = ml;
  }
  return cmsPageComponentDataExtendInfo;
}

Map<String, dynamic> $CmsPageComponentDataExtendInfoToJson(
    CmsPageComponentDataExtendInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['mb'] = entity.mb;
  data['mr'] = entity.mr;
  data['mt'] = entity.mt;
  data['ml'] = entity.ml;
  return data;
}

extension CmsPageComponentDataExtendInfoExtension on CmsPageComponentDataExtendInfo {
  CmsPageComponentDataExtendInfo copyWith({
    double? mb,
    double? mr,
    double? mt,
    double? ml,
  }) {
    return CmsPageComponentDataExtendInfo()
      ..mb = mb ?? this.mb
      ..mr = mr ?? this.mr
      ..mt = mt ?? this.mt
      ..ml = ml ?? this.ml;
  }
}

CmsPageComponentPageSetting $CmsPageComponentPageSettingFromJson(
    Map<String, dynamic> json) {
  final CmsPageComponentPageSetting cmsPageComponentPageSetting = CmsPageComponentPageSetting();
  final String? backgroundColor = jsonConvert.convert<String>(
      json['backgroundColor']);
  if (backgroundColor != null) {
    cmsPageComponentPageSetting.backgroundColor = backgroundColor;
  }
  return cmsPageComponentPageSetting;
}

Map<String, dynamic> $CmsPageComponentPageSettingToJson(
    CmsPageComponentPageSetting entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['backgroundColor'] = entity.backgroundColor;
  return data;
}

extension CmsPageComponentPageSettingExtension on CmsPageComponentPageSetting {
  CmsPageComponentPageSetting copyWith({
    String? backgroundColor,
  }) {
    return CmsPageComponentPageSetting()
      ..backgroundColor = backgroundColor ?? this.backgroundColor;
  }
}

CmsPageSetting $CmsPageSettingFromJson(Map<String, dynamic> json) {
  final CmsPageSetting cmsPageSetting = CmsPageSetting();
  final String? backgroundColor = jsonConvert.convert<String>(
      json['backgroundColor']);
  if (backgroundColor != null) {
    cmsPageSetting.backgroundColor = backgroundColor;
  }
  return cmsPageSetting;
}

Map<String, dynamic> $CmsPageSettingToJson(CmsPageSetting entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['backgroundColor'] = entity.backgroundColor;
  return data;
}

extension CmsPageSettingExtension on CmsPageSetting {
  CmsPageSetting copyWith({
    String? backgroundColor,
  }) {
    return CmsPageSetting()
      ..backgroundColor = backgroundColor ?? this.backgroundColor;
  }
}

CmsShareImg $CmsShareImgFromJson(Map<String, dynamic> json) {
  final CmsShareImg cmsShareImg = CmsShareImg();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    cmsShareImg.name = name;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    cmsShareImg.url = url;
  }
  return cmsShareImg;
}

Map<String, dynamic> $CmsShareImgToJson(CmsShareImg entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['url'] = entity.url;
  return data;
}

extension CmsShareImgExtension on CmsShareImg {
  CmsShareImg copyWith({
    String? name,
    String? url,
  }) {
    return CmsShareImg()
      ..name = name ?? this.name
      ..url = url ?? this.url;
  }
}