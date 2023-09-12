import 'package:flutter_module/generated/json/base/json_convert_content.dart';
import 'package:flutter_module/module/user/domain/model/agreement_info_entity.dart';

AgreementInfoEntity $AgreementInfoEntityFromJson(Map<String, dynamic> json) {
  final AgreementInfoEntity agreementInfoEntity = AgreementInfoEntity();
  final AgreementInfoItem? privacy = jsonConvert.convert<AgreementInfoItem>(
      json['PRIVACY']);
  if (privacy != null) {
    agreementInfoEntity.privacy = privacy;
  }
  final AgreementInfoItem? service = jsonConvert.convert<AgreementInfoItem>(
      json['SERVICE']);
  if (service != null) {
    agreementInfoEntity.service = service;
  }
  final AgreementInfoItem? sdk = jsonConvert.convert<AgreementInfoItem>(
      json['SDK']);
  if (sdk != null) {
    agreementInfoEntity.sdk = sdk;
  }
  final AgreementInfoItem? disclaimer = jsonConvert.convert<AgreementInfoItem>(
      json['DISCLAIMER']);
  if (disclaimer != null) {
    agreementInfoEntity.disclaimer = disclaimer;
  }
  return agreementInfoEntity;
}

Map<String, dynamic> $AgreementInfoEntityToJson(AgreementInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['PRIVACY'] = entity.privacy.toJson();
  data['SERVICE'] = entity.service.toJson();
  data['SDK'] = entity.sdk.toJson();
  data['DISCLAIMER'] = entity.disclaimer.toJson();
  return data;
}

extension AgreementInfoEntityExtension on AgreementInfoEntity {
  AgreementInfoEntity copyWith({
    AgreementInfoItem? privacy,
    AgreementInfoItem? service,
    AgreementInfoItem? sdk,
    AgreementInfoItem? disclaimer,
  }) {
    return AgreementInfoEntity()
      ..privacy = privacy ?? this.privacy
      ..service = service ?? this.service
      ..sdk = sdk ?? this.sdk
      ..disclaimer = disclaimer ?? this.disclaimer;
  }
}

AgreementInfoItem $AgreementInfoItemFromJson(Map<String, dynamic> json) {
  final AgreementInfoItem agreementInfoItem = AgreementInfoItem();
  final int? agreementType = jsonConvert.convert<int>(json['agreementType']);
  if (agreementType != null) {
    agreementInfoItem.agreementType = agreementType;
  }
  final String? agreementUrl = jsonConvert.convert<String>(
      json['agreementUrl']);
  if (agreementUrl != null) {
    agreementInfoItem.agreementUrl = agreementUrl;
  }
  final int? agreementVersion = jsonConvert.convert<int>(
      json['agreementVersion']);
  if (agreementVersion != null) {
    agreementInfoItem.agreementVersion = agreementVersion;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    agreementInfoItem.id = id;
  }
  final int? popupFlag = jsonConvert.convert<int>(json['popupFlag']);
  if (popupFlag != null) {
    agreementInfoItem.popupFlag = popupFlag;
  }
  return agreementInfoItem;
}

Map<String, dynamic> $AgreementInfoItemToJson(AgreementInfoItem entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['agreementType'] = entity.agreementType;
  data['agreementUrl'] = entity.agreementUrl;
  data['agreementVersion'] = entity.agreementVersion;
  data['id'] = entity.id;
  data['popupFlag'] = entity.popupFlag;
  return data;
}

extension AgreementInfoItemExtension on AgreementInfoItem {
  AgreementInfoItem copyWith({
    int? agreementType,
    String? agreementUrl,
    int? agreementVersion,
    String? id,
    int? popupFlag,
  }) {
    return AgreementInfoItem()
      ..agreementType = agreementType ?? this.agreementType
      ..agreementUrl = agreementUrl ?? this.agreementUrl
      ..agreementVersion = agreementVersion ?? this.agreementVersion
      ..id = id ?? this.id
      ..popupFlag = popupFlag ?? this.popupFlag;
  }
}