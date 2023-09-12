import 'package:common_lib/generated/json/base/json_convert_content.dart';
import 'package:common_lib/service/startConfig/model/app_start_config_entity.dart';

AppStartConfigEntity $AppStartConfigEntityFromJson(Map<String, dynamic> json) {
	final AppStartConfigEntity appStartConfigEntity = AppStartConfigEntity();
	final bool? applyFlag = jsonConvert.convert<bool>(json['applyFlag']);
	if (applyFlag != null) {
		appStartConfigEntity.applyFlag = applyFlag;
	}
	final int? imAppid = jsonConvert.convert<int>(json['imAppid']);
	if (imAppid != null) {
		appStartConfigEntity.imAppid = imAppid;
	}
	final String? tenantId = jsonConvert.convert<String>(json['tenantId']);
	if (tenantId != null) {
		appStartConfigEntity.tenantId = tenantId;
	}
	return appStartConfigEntity;
}

Map<String, dynamic> $AppStartConfigEntityToJson(AppStartConfigEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['applyFlag'] = entity.applyFlag;
	data['imAppid'] = entity.imAppid;
	data['tenantId'] = entity.tenantId;
	return data;
}