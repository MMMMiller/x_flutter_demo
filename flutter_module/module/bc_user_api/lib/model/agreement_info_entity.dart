import 'package:bc_user_api/generated/json/base/json_field.dart';
import 'package:bc_user_api/generated/json/agreement_info_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class AgreementInfoEntity {

	@JSONField(name: "PRIVACY")
	late AgreementInfoItem privacy;
	@JSONField(name: "SERVICE")
	late AgreementInfoItem service;
	@JSONField(name: "SDK")
	late AgreementInfoItem sdk;
  @JSONField(name: "DISCLAIMER")
  late AgreementInfoItem disclaimer;

  AgreementInfoEntity();

  factory AgreementInfoEntity.fromJson(Map<String, dynamic> json) => $AgreementInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $AgreementInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AgreementInfoItem {

	late int agreementType;
	late String agreementUrl;
	late int agreementVersion;
	late String id;
	late int popupFlag;

  AgreementInfoItem();

  factory AgreementInfoItem.fromJson(Map<String, dynamic> json) => $AgreementInfoItemFromJson(json);

  Map<String, dynamic> toJson() => $AgreementInfoItemToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
