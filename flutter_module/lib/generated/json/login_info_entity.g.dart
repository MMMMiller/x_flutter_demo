import 'package:flutter_module/generated/json/base/json_convert_content.dart';
import 'package:flutter_module/domain/user/model/login_info_entity.dart';

LoginInfoEntity $LoginInfoEntityFromJson(Map<String, dynamic> json) {
  final LoginInfoEntity loginInfoEntity = LoginInfoEntity();
  final String? tenantId = jsonConvert.convert<String>(json['tenantId']);
  if (tenantId != null) {
    loginInfoEntity.tenantId = tenantId;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    loginInfoEntity.token = token;
  }
  final String? userId = jsonConvert.convert<String>(json['userId']);
  if (userId != null) {
    loginInfoEntity.userId = userId;
  }
  final String? tokenExpireTime = jsonConvert.convert<String>(
      json['tokenExpireTime']);
  if (tokenExpireTime != null) {
    loginInfoEntity.tokenExpireTime = tokenExpireTime;
  }
  return loginInfoEntity;
}

Map<String, dynamic> $LoginInfoEntityToJson(LoginInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['tenantId'] = entity.tenantId;
  data['token'] = entity.token;
  data['userId'] = entity.userId;
  data['tokenExpireTime'] = entity.tokenExpireTime;
  return data;
}

extension LoginInfoEntityExtension on LoginInfoEntity {
  LoginInfoEntity copyWith({
    String? tenantId,
    String? token,
    String? userId,
    String? tokenExpireTime,
  }) {
    return LoginInfoEntity()
      ..tenantId = tenantId ?? this.tenantId
      ..token = token ?? this.token
      ..userId = userId ?? this.userId
      ..tokenExpireTime = tokenExpireTime ?? this.tokenExpireTime;
  }
}