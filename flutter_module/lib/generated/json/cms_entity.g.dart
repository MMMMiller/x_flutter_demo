import 'package:flutter_module/generated/json/base/json_convert_content.dart';
import 'package:flutter_module/domain/model/cms_entity.dart';

CmsEntity $CmsEntityFromJson(Map<String, dynamic> json) {
  final CmsEntity cmsEntity = CmsEntity();
  final int? auditStatus = jsonConvert.convert<int>(json['auditStatus']);
  if (auditStatus != null) {
    cmsEntity.auditStatus = auditStatus;
  }
  final String? channel = jsonConvert.convert<String>(json['channel']);
  if (channel != null) {
    cmsEntity.channel = channel;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    cmsEntity.code = code;
  }
  final int? componentVersion = jsonConvert.convert<int>(
      json['componentVersion']);
  if (componentVersion != null) {
    cmsEntity.componentVersion = componentVersion;
  }
  final int? componentVersionPublished = jsonConvert.convert<int>(
      json['componentVersionPublished']);
  if (componentVersionPublished != null) {
    cmsEntity.componentVersionPublished = componentVersionPublished;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    cmsEntity.createTime = createTime;
  }
  final String? creatorId = jsonConvert.convert<String>(json['creatorId']);
  if (creatorId != null) {
    cmsEntity.creatorId = creatorId;
  }
  final String? creatorName = jsonConvert.convert<String>(json['creatorName']);
  if (creatorName != null) {
    cmsEntity.creatorName = creatorName;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    cmsEntity.description = description;
  }
  final String? editorId = jsonConvert.convert<String>(json['editorId']);
  if (editorId != null) {
    cmsEntity.editorId = editorId;
  }
  final String? editorName = jsonConvert.convert<String>(json['editorName']);
  if (editorName != null) {
    cmsEntity.editorName = editorName;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    cmsEntity.id = id;
  }
  final int? isIndex = jsonConvert.convert<int>(json['isIndex']);
  if (isIndex != null) {
    cmsEntity.isIndex = isIndex;
  }
  final int? isLogin = jsonConvert.convert<int>(json['isLogin']);
  if (isLogin != null) {
    cmsEntity.isLogin = isLogin;
  }
  final int? listingStatus = jsonConvert.convert<int>(json['listingStatus']);
  if (listingStatus != null) {
    cmsEntity.listingStatus = listingStatus;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    cmsEntity.name = name;
  }
  final CmsPageComponent? pageComponent = jsonConvert.convert<CmsPageComponent>(
      json['pageComponent']);
  if (pageComponent != null) {
    cmsEntity.pageComponent = pageComponent;
  }
  final CmsPageSetting? pageSetting = jsonConvert.convert<CmsPageSetting>(
      json['pageSetting']);
  if (pageSetting != null) {
    cmsEntity.pageSetting = pageSetting;
  }
  final String? shareDescription = jsonConvert.convert<String>(
      json['shareDescription']);
  if (shareDescription != null) {
    cmsEntity.shareDescription = shareDescription;
  }
  final CmsShareImg? shareImg = jsonConvert.convert<CmsShareImg>(
      json['shareImg']);
  if (shareImg != null) {
    cmsEntity.shareImg = shareImg;
  }
  final String? shareTitle = jsonConvert.convert<String>(json['shareTitle']);
  if (shareTitle != null) {
    cmsEntity.shareTitle = shareTitle;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    cmsEntity.status = status;
  }
  final List<String>? suitableOrgList = (json['suitableOrgList'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (suitableOrgList != null) {
    cmsEntity.suitableOrgList = suitableOrgList;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    cmsEntity.type = type;
  }
  final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
  if (updateTime != null) {
    cmsEntity.updateTime = updateTime;
  }
  return cmsEntity;
}

Map<String, dynamic> $CmsEntityToJson(CmsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['auditStatus'] = entity.auditStatus;
  data['channel'] = entity.channel;
  data['code'] = entity.code;
  data['componentVersion'] = entity.componentVersion;
  data['componentVersionPublished'] = entity.componentVersionPublished;
  data['createTime'] = entity.createTime;
  data['creatorId'] = entity.creatorId;
  data['creatorName'] = entity.creatorName;
  data['description'] = entity.description;
  data['editorId'] = entity.editorId;
  data['editorName'] = entity.editorName;
  data['id'] = entity.id;
  data['isIndex'] = entity.isIndex;
  data['isLogin'] = entity.isLogin;
  data['listingStatus'] = entity.listingStatus;
  data['name'] = entity.name;
  data['pageComponent'] = entity.pageComponent?.toJson();
  data['pageSetting'] = entity.pageSetting?.toJson();
  data['shareDescription'] = entity.shareDescription;
  data['shareImg'] = entity.shareImg?.toJson();
  data['shareTitle'] = entity.shareTitle;
  data['status'] = entity.status;
  data['suitableOrgList'] = entity.suitableOrgList;
  data['type'] = entity.type;
  data['updateTime'] = entity.updateTime;
  return data;
}

extension CmsEntityExtension on CmsEntity {
  CmsEntity copyWith({
    int? auditStatus,
    String? channel,
    String? code,
    int? componentVersion,
    int? componentVersionPublished,
    String? createTime,
    String? creatorId,
    String? creatorName,
    String? description,
    String? editorId,
    String? editorName,
    String? id,
    int? isIndex,
    int? isLogin,
    int? listingStatus,
    String? name,
    CmsPageComponent? pageComponent,
    CmsPageSetting? pageSetting,
    String? shareDescription,
    CmsShareImg? shareImg,
    String? shareTitle,
    int? status,
    List<String>? suitableOrgList,
    int? type,
    String? updateTime,
  }) {
    return CmsEntity()
      ..auditStatus = auditStatus ?? this.auditStatus
      ..channel = channel ?? this.channel
      ..code = code ?? this.code
      ..componentVersion = componentVersion ?? this.componentVersion
      ..componentVersionPublished = componentVersionPublished ??
          this.componentVersionPublished
      ..createTime = createTime ?? this.createTime
      ..creatorId = creatorId ?? this.creatorId
      ..creatorName = creatorName ?? this.creatorName
      ..description = description ?? this.description
      ..editorId = editorId ?? this.editorId
      ..editorName = editorName ?? this.editorName
      ..id = id ?? this.id
      ..isIndex = isIndex ?? this.isIndex
      ..isLogin = isLogin ?? this.isLogin
      ..listingStatus = listingStatus ?? this.listingStatus
      ..name = name ?? this.name
      ..pageComponent = pageComponent ?? this.pageComponent
      ..pageSetting = pageSetting ?? this.pageSetting
      ..shareDescription = shareDescription ?? this.shareDescription
      ..shareImg = shareImg ?? this.shareImg
      ..shareTitle = shareTitle ?? this.shareTitle
      ..status = status ?? this.status
      ..suitableOrgList = suitableOrgList ?? this.suitableOrgList
      ..type = type ?? this.type
      ..updateTime = updateTime ?? this.updateTime;
  }
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