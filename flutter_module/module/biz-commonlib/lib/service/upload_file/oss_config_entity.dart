import 'package:common_lib/generated/json/base/json_field.dart';
import 'package:common_lib/generated/json/oss_config_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class OssConfigEntity {

	String? accessId;
	String? bucketName;
	String? callback;
	String? cdnHost;
	String? dir;
	String? expire;
	String? fileName;
	String? host;
	String? originalName;
	String? policy;
	String? signature;
	String? udcMaterialId;
  
  OssConfigEntity();

  factory OssConfigEntity.fromJson(Map<String, dynamic> json) => $OssConfigEntityFromJson(json);

  Map<String, dynamic> toJson() => $OssConfigEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}