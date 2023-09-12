import 'package:common_lib/generated/json/base/json_field.dart';
import 'package:common_lib/generated/json/app_update_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class AppUpdateEntity {

	int? appId;
	String? createTime;
	String? creatorId;
	int? deleteFlag;
	String? downloadUrl;
	String? editorId;
	String? id;
	int? innerMaxNum;
	int? status;
	int? systemType;
	String? tenantId;
	String? updateContent;
	String? updateTime;
	int? updateType;
	String? versionNum;
  
  AppUpdateEntity();

  factory AppUpdateEntity.fromJson(Map<String, dynamic> json) => $AppUpdateEntityFromJson(json);

  Map<String, dynamic> toJson() => $AppUpdateEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}