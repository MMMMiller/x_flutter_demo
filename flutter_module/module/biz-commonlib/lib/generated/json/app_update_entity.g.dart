import 'package:common_lib/generated/json/base/json_convert_content.dart';
import 'package:common_lib/service/update/model/app_update_entity.dart';

AppUpdateEntity $AppUpdateEntityFromJson(Map<String, dynamic> json) {
	final AppUpdateEntity appUpdateEntity = AppUpdateEntity();
	final int? appId = jsonConvert.convert<int>(json['appId']);
	if (appId != null) {
		appUpdateEntity.appId = appId;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		appUpdateEntity.createTime = createTime;
	}
	final String? creatorId = jsonConvert.convert<String>(json['creatorId']);
	if (creatorId != null) {
		appUpdateEntity.creatorId = creatorId;
	}
	final int? deleteFlag = jsonConvert.convert<int>(json['deleteFlag']);
	if (deleteFlag != null) {
		appUpdateEntity.deleteFlag = deleteFlag;
	}
	final String? downloadUrl = jsonConvert.convert<String>(json['downloadUrl']);
	if (downloadUrl != null) {
		appUpdateEntity.downloadUrl = downloadUrl;
	}
	final String? editorId = jsonConvert.convert<String>(json['editorId']);
	if (editorId != null) {
		appUpdateEntity.editorId = editorId;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		appUpdateEntity.id = id;
	}
	final int? innerMaxNum = jsonConvert.convert<int>(json['innerMaxNum']);
	if (innerMaxNum != null) {
		appUpdateEntity.innerMaxNum = innerMaxNum;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		appUpdateEntity.status = status;
	}
	final int? systemType = jsonConvert.convert<int>(json['systemType']);
	if (systemType != null) {
		appUpdateEntity.systemType = systemType;
	}
	final String? tenantId = jsonConvert.convert<String>(json['tenantId']);
	if (tenantId != null) {
		appUpdateEntity.tenantId = tenantId;
	}
	final String? updateContent = jsonConvert.convert<String>(json['updateContent']);
	if (updateContent != null) {
		appUpdateEntity.updateContent = updateContent;
	}
	final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
	if (updateTime != null) {
		appUpdateEntity.updateTime = updateTime;
	}
	final int? updateType = jsonConvert.convert<int>(json['updateType']);
	if (updateType != null) {
		appUpdateEntity.updateType = updateType;
	}
	final String? versionNum = jsonConvert.convert<String>(json['versionNum']);
	if (versionNum != null) {
		appUpdateEntity.versionNum = versionNum;
	}
	return appUpdateEntity;
}

Map<String, dynamic> $AppUpdateEntityToJson(AppUpdateEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['appId'] = entity.appId;
	data['createTime'] = entity.createTime;
	data['creatorId'] = entity.creatorId;
	data['deleteFlag'] = entity.deleteFlag;
	data['downloadUrl'] = entity.downloadUrl;
	data['editorId'] = entity.editorId;
	data['id'] = entity.id;
	data['innerMaxNum'] = entity.innerMaxNum;
	data['status'] = entity.status;
	data['systemType'] = entity.systemType;
	data['tenantId'] = entity.tenantId;
	data['updateContent'] = entity.updateContent;
	data['updateTime'] = entity.updateTime;
	data['updateType'] = entity.updateType;
	data['versionNum'] = entity.versionNum;
	return data;
}