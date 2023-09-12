import 'dart:convert';

import 'package:common_lib/generated/json/base/json_field.dart';

import 'package:common_lib/generated/json/app_start_config_entity.g.dart';

@JsonSerializable()
class AppStartConfigEntity {
   bool? applyFlag; // 是否在审核中
   int? imAppid; // im appid
   String? tenantId; // 租户id
   AppStartConfigEntity();

   factory AppStartConfigEntity.fromJson(Map<String, dynamic> json) => $AppStartConfigEntityFromJson(json);

   Map<String, dynamic> toJson() => $AppStartConfigEntityToJson(this);
   @override
   String toString() {
      return jsonEncode(this);
   }
}