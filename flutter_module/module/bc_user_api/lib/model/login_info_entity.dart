import 'package:bc_user_api/generated/json/base/json_field.dart';
import 'package:bc_user_api/generated/json/login_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LoginInfoEntity {

	String? tenantId;
	String? token;
	String? userId;
  String? tokenExpireTime;
  
  LoginInfoEntity();

  factory LoginInfoEntity.fromJson(Map<String, dynamic> json) => $LoginInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $LoginInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}