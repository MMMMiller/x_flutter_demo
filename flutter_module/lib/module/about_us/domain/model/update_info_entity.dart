import 'dart:convert';
import 'package:flutter_module/generated/json/base/json_field.dart';
import 'package:flutter_module/generated/json/update_info_entity.g.dart';
import 'package:flutter_module/generated/json/user_info_entity.g.dart';

@JsonSerializable()
class UpdateInfoEntity {
  bool? hasPassword;
  String? id;
  int? status;
  String? username;
  UpdateInfoEntity();

  factory UpdateInfoEntity.fromJson(Map<String, dynamic> json) =>
      $UpdateInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $UpdateInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
