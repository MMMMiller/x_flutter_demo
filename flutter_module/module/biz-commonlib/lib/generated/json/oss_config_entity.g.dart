import 'package:common_lib/generated/json/base/json_convert_content.dart';
import 'package:common_lib/service/upload_file/oss_config_entity.dart';

OssConfigEntity $OssConfigEntityFromJson(Map<String, dynamic> json) {
	final OssConfigEntity ossConfigEntity = OssConfigEntity();
	final String? accessId = jsonConvert.convert<String>(json['accessId']);
	if (accessId != null) {
		ossConfigEntity.accessId = accessId;
	}
	final String? bucketName = jsonConvert.convert<String>(json['bucketName']);
	if (bucketName != null) {
		ossConfigEntity.bucketName = bucketName;
	}
	final String? callback = jsonConvert.convert<String>(json['callback']);
	if (callback != null) {
		ossConfigEntity.callback = callback;
	}
	final String? cdnHost = jsonConvert.convert<String>(json['cdnHost']);
	if (cdnHost != null) {
		ossConfigEntity.cdnHost = cdnHost;
	}
	final String? dir = jsonConvert.convert<String>(json['dir']);
	if (dir != null) {
		ossConfigEntity.dir = dir;
	}
	final String? expire = jsonConvert.convert<String>(json['expire']);
	if (expire != null) {
		ossConfigEntity.expire = expire;
	}
	final String? fileName = jsonConvert.convert<String>(json['fileName']);
	if (fileName != null) {
		ossConfigEntity.fileName = fileName;
	}
	final String? host = jsonConvert.convert<String>(json['host']);
	if (host != null) {
		ossConfigEntity.host = host;
	}
	final String? originalName = jsonConvert.convert<String>(json['originalName']);
	if (originalName != null) {
		ossConfigEntity.originalName = originalName;
	}
	final String? policy = jsonConvert.convert<String>(json['policy']);
	if (policy != null) {
		ossConfigEntity.policy = policy;
	}
	final String? signature = jsonConvert.convert<String>(json['signature']);
	if (signature != null) {
		ossConfigEntity.signature = signature;
	}
	final String? udcMaterialId = jsonConvert.convert<String>(json['udcMaterialId']);
	if (udcMaterialId != null) {
		ossConfigEntity.udcMaterialId = udcMaterialId;
	}
	return ossConfigEntity;
}

Map<String, dynamic> $OssConfigEntityToJson(OssConfigEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['accessId'] = entity.accessId;
	data['bucketName'] = entity.bucketName;
	data['callback'] = entity.callback;
	data['cdnHost'] = entity.cdnHost;
	data['dir'] = entity.dir;
	data['expire'] = entity.expire;
	data['fileName'] = entity.fileName;
	data['host'] = entity.host;
	data['originalName'] = entity.originalName;
	data['policy'] = entity.policy;
	data['signature'] = entity.signature;
	data['udcMaterialId'] = entity.udcMaterialId;
	return data;
}