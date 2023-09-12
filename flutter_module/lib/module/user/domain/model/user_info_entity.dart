
import 'dart:convert';

import 'package:flutter_module/generated/json/base/json_field.dart';
import 'package:flutter_module/generated/json/user_info_entity.g.dart';

@JsonSerializable()
class UserInfoEntity {

	UserInfoEmployeeAccount? employeeAccount;
	UserInfoEmployeeBase? employeeBase;
	UserInfoEmployeeOrg? employeeOrg;
  
  UserInfoEntity();

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) => $UserInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoEmployeeAccount {

	bool? hasPassword;
	String? id;
	int? status;
	UserInfoEmployeeAccountStatusPackage? statusPackage;
	String? username;
  
  UserInfoEmployeeAccount();

  factory UserInfoEmployeeAccount.fromJson(Map<String, dynamic> json) => $UserInfoEmployeeAccountFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEmployeeAccountToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoEmployeeAccountStatusPackage {

	int? code;
	String? desc;
  
  UserInfoEmployeeAccountStatusPackage();

  factory UserInfoEmployeeAccountStatusPackage.fromJson(Map<String, dynamic> json) => $UserInfoEmployeeAccountStatusPackageFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEmployeeAccountStatusPackageToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoEmployeeBase {

	String? birthday;
	int? eduLevel;
	UserInfoEmployeeBaseEduLevelPackage? eduLevelPackage;
	String? emergencyContact;
	String? emergencyPhone;
	int? gender;
	UserInfoEmployeeBaseGenderPackage? genderPackage;
	String? homeAddress;
	String? id;
	String? idCard;
	String? idCardBack;
	String? idCardFront;
	int? jobStatus;
	int? maritalStatus;
	UserInfoEmployeeBaseMaritalStatusPackage? maritalStatusPackage;
	String? name;
	String? nation;
	String? phone;
	String? photo;
	int? politicalOutlook;
	UserInfoEmployeeBasePoliticalOutlookPackage? politicalOutlookPackage;
	String? profile;
  
  UserInfoEmployeeBase();

  factory UserInfoEmployeeBase.fromJson(Map<String, dynamic> json) => $UserInfoEmployeeBaseFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEmployeeBaseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoEmployeeBaseEduLevelPackage {

	int? code;
	String? desc;
  
  UserInfoEmployeeBaseEduLevelPackage();

  factory UserInfoEmployeeBaseEduLevelPackage.fromJson(Map<String, dynamic> json) => $UserInfoEmployeeBaseEduLevelPackageFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEmployeeBaseEduLevelPackageToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoEmployeeBaseGenderPackage {

	int? code;
	String? desc;
  
  UserInfoEmployeeBaseGenderPackage();

  factory UserInfoEmployeeBaseGenderPackage.fromJson(Map<String, dynamic> json) => $UserInfoEmployeeBaseGenderPackageFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEmployeeBaseGenderPackageToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoEmployeeBaseMaritalStatusPackage {

	int? code;
	String? desc;
  
  UserInfoEmployeeBaseMaritalStatusPackage();

  factory UserInfoEmployeeBaseMaritalStatusPackage.fromJson(Map<String, dynamic> json) => $UserInfoEmployeeBaseMaritalStatusPackageFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEmployeeBaseMaritalStatusPackageToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoEmployeeBasePoliticalOutlookPackage {

	int? code;
	String? desc;
  
  UserInfoEmployeeBasePoliticalOutlookPackage();

  factory UserInfoEmployeeBasePoliticalOutlookPackage.fromJson(Map<String, dynamic> json) => $UserInfoEmployeeBasePoliticalOutlookPackageFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEmployeeBasePoliticalOutlookPackageToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoEmployeeOrg {

	UserInfoEmployeeOrgMainOrg? mainOrg;
	String? mainOrgId;
	List<String>? orgIdList;
	List<UserInfoEmployeeOrgOrgList>? orgList;
  
  UserInfoEmployeeOrg();

  factory UserInfoEmployeeOrg.fromJson(Map<String, dynamic> json) => $UserInfoEmployeeOrgFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEmployeeOrgToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoEmployeeOrgMainOrg {

	String? id;
	int? identityType;
	UserInfoEmployeeOrgMainOrgIdentityTypePackage? identityTypePackage;
	int? mainFlag;
	UserInfoEmployeeOrgMainOrgOrg? org;
  
  UserInfoEmployeeOrgMainOrg();

  factory UserInfoEmployeeOrgMainOrg.fromJson(Map<String, dynamic> json) => $UserInfoEmployeeOrgMainOrgFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEmployeeOrgMainOrgToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoEmployeeOrgMainOrgIdentityTypePackage {

	int? code;
	String? desc;
  
  UserInfoEmployeeOrgMainOrgIdentityTypePackage();

  factory UserInfoEmployeeOrgMainOrgIdentityTypePackage.fromJson(Map<String, dynamic> json) => $UserInfoEmployeeOrgMainOrgIdentityTypePackageFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEmployeeOrgMainOrgIdentityTypePackageToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoEmployeeOrgMainOrgOrg {

	String? abbreviation;
	String? id;
	String? name;
	int? type;
  
  UserInfoEmployeeOrgMainOrgOrg();

  factory UserInfoEmployeeOrgMainOrgOrg.fromJson(Map<String, dynamic> json) => $UserInfoEmployeeOrgMainOrgOrgFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEmployeeOrgMainOrgOrgToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoEmployeeOrgOrgList {

	String? id;
	int? identityType;
	UserInfoEmployeeOrgOrgListIdentityTypePackage? identityTypePackage;
	int? mainFlag;
	UserInfoEmployeeOrgOrgListOrg? org;
  
  UserInfoEmployeeOrgOrgList();

  factory UserInfoEmployeeOrgOrgList.fromJson(Map<String, dynamic> json) => $UserInfoEmployeeOrgOrgListFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEmployeeOrgOrgListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoEmployeeOrgOrgListIdentityTypePackage {

	int? code;
	String? desc;
  
  UserInfoEmployeeOrgOrgListIdentityTypePackage();

  factory UserInfoEmployeeOrgOrgListIdentityTypePackage.fromJson(Map<String, dynamic> json) => $UserInfoEmployeeOrgOrgListIdentityTypePackageFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEmployeeOrgOrgListIdentityTypePackageToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoEmployeeOrgOrgListOrg {

	String? abbreviation;
	String? id;
	String? name;
	int? type;
  
  UserInfoEmployeeOrgOrgListOrg();

  factory UserInfoEmployeeOrgOrgListOrg.fromJson(Map<String, dynamic> json) => $UserInfoEmployeeOrgOrgListOrgFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEmployeeOrgOrgListOrgToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}