import 'package:flutter_module/generated/json/base/json_convert_content.dart';
import 'package:flutter_module/module/about_us/domain/model/update_info_entity.dart';

UpdateInfoEntity $UpdateInfoEntityFromJson(Map<String, dynamic> json) {
  final UpdateInfoEntity updateInfoEntity = UpdateInfoEntity();
  final bool? hasPassword = jsonConvert.convert<bool>(json['hasPassword']);
  if (hasPassword != null) {
    updateInfoEntity.hasPassword = hasPassword;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    updateInfoEntity.id = id;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    updateInfoEntity.status = status;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    updateInfoEntity.username = username;
  }
  return updateInfoEntity;
}

Map<String, dynamic> $UpdateInfoEntityToJson(UpdateInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['hasPassword'] = entity.hasPassword;
  data['id'] = entity.id;
  data['status'] = entity.status;
  data['username'] = entity.username;
  return data;
}

extension UpdateInfoEntityExtension on UpdateInfoEntity {
  UpdateInfoEntity copyWith({
    bool? hasPassword,
    String? id,
    int? status,
    String? username,
  }) {
    return UpdateInfoEntity()
      ..hasPassword = hasPassword ?? this.hasPassword
      ..id = id ?? this.id
      ..status = status ?? this.status
      ..username = username ?? this.username;
  }
}