
import 'dart:convert';

import 'package:flutter_module/generated/json/base/json_field.dart';
import 'package:flutter_module/generated/json/employee_detail_entity.g.dart';

@JsonSerializable()
class EmployeeDetailEntity {

	EmployeeDetailEmployeeAccount? employeeAccount;
	EmployeeDetailEmployeeAuth? employeeAuth;
	EmployeeDetailEmployeeBase? employeeBase;
	EmployeeDetailEmployeeCommunication? employeeCommunication;
	List<dynamic>? employeeGroupIdList;
	List<dynamic>? employeeGroupList;
	EmployeeDetailEmployeeLabour? employeeLabour;
	EmployeeDetailEmployeeOrg? employeeOrg;
	EmployeeDetailEmployeePost? employeePost;
	EmployeeDetailEmployeePractice? employeePractice;
	EmployeeDetailEmployeePunish? employeePunish;
  
  EmployeeDetailEntity();

  factory EmployeeDetailEntity.fromJson(Map<String, dynamic> json) => $EmployeeDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeeAccount {

	String? id;
	int? status;
	EmployeeDetailEmployeeAccountStatusPackage? statusPackage;
	String? username;
  
  EmployeeDetailEmployeeAccount();

  factory EmployeeDetailEmployeeAccount.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeeAccountFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeeAccountToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeeAccountStatusPackage {

	int? code;
	String? desc;
  
  EmployeeDetailEmployeeAccountStatusPackage();

  factory EmployeeDetailEmployeeAccountStatusPackage.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeeAccountStatusPackageFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeeAccountStatusPackageToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeeAuth {

	List<String>? authRoleIdList;
	List<EmployeeDetailEmployeeAuthAuthRoleList>? authRoleList;
  
  EmployeeDetailEmployeeAuth();

  factory EmployeeDetailEmployeeAuth.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeeAuthFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeeAuthToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeeAuthAuthRoleList {

	bool? enableFlag;
	bool? extendsFlag;
	String? id;
	int? pattern;
	String? roleName;
	List<EmployeeDetailEmployeeAuthAuthRoleListSourceList>? sourceList;
	int? status;
  
  EmployeeDetailEmployeeAuthAuthRoleList();

  factory EmployeeDetailEmployeeAuthAuthRoleList.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeeAuthAuthRoleListFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeeAuthAuthRoleListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeeAuthAuthRoleListSourceList {

	String? refName;
	String? sourceLabel;
  
  EmployeeDetailEmployeeAuthAuthRoleListSourceList();

  factory EmployeeDetailEmployeeAuthAuthRoleListSourceList.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeeAuthAuthRoleListSourceListFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeeAuthAuthRoleListSourceListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeeBase {

	int? age;
	String? birthday;
	int? eduLevel;
	EmployeeDetailEmployeeBaseEduLevelPackage? eduLevelPackage;
	String? emergencyContact;
	String? emergencyPhone;
	int? gender;
	EmployeeDetailEmployeeBaseGenderPackage? genderPackage;
	String? homeAddress;
	String? id;
	String? idCard;
	String? idCardBack;
	String? idCardFront;
	int? jobStatus;
	String? name;
	String? nation;
	String? phone;
	String? photo;
	String? profile;
	String? quitReason;
  
  EmployeeDetailEmployeeBase();

  factory EmployeeDetailEmployeeBase.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeeBaseFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeeBaseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeeBaseEduLevelPackage {

	int? code;
	String? desc;
  
  EmployeeDetailEmployeeBaseEduLevelPackage();

  factory EmployeeDetailEmployeeBaseEduLevelPackage.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeeBaseEduLevelPackageFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeeBaseEduLevelPackageToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeeBaseGenderPackage {

	int? code;
	String? desc;
  
  EmployeeDetailEmployeeBaseGenderPackage();

  factory EmployeeDetailEmployeeBaseGenderPackage.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeeBaseGenderPackageFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeeBaseGenderPackageToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeeCommunication {

	String? id;
	String? officeTel;
	String? workEmail;
	String? workQq;
	String? workWechat;
  
  EmployeeDetailEmployeeCommunication();

  factory EmployeeDetailEmployeeCommunication.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeeCommunicationFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeeCommunicationToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeeLabour {

	String? id;
	String? jobNumber;
	String? laborContract;
	String? laborContractName;
	String? laborContractNumber;
	String? workAddress;
  
  EmployeeDetailEmployeeLabour();

  factory EmployeeDetailEmployeeLabour.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeeLabourFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeeLabourToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeeOrg {

	EmployeeDetailEmployeeOrgMainOrg? mainOrg;
	String? mainOrgId;
	List<String>? orgIdList;
	List<EmployeeDetailEmployeeOrgOrgList>? orgList;
  
  EmployeeDetailEmployeeOrg();

  factory EmployeeDetailEmployeeOrg.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeeOrgFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeeOrgToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeeOrgMainOrg {

	String? id;
	int? identityType;
	EmployeeDetailEmployeeOrgMainOrgIdentityTypePackage? identityTypePackage;
	int? mainFlag;
	EmployeeDetailEmployeeOrgMainOrgOrg? org;
	List<EmployeeDetailEmployeeOrgMainOrgOrgParentLink>? orgParentLink;
  
  EmployeeDetailEmployeeOrgMainOrg();

  factory EmployeeDetailEmployeeOrgMainOrg.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeeOrgMainOrgFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeeOrgMainOrgToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeeOrgMainOrgIdentityTypePackage {

	int? code;
	String? desc;
  
  EmployeeDetailEmployeeOrgMainOrgIdentityTypePackage();

  factory EmployeeDetailEmployeeOrgMainOrgIdentityTypePackage.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeeOrgMainOrgIdentityTypePackageFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeeOrgMainOrgIdentityTypePackageToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeeOrgMainOrgOrg {

	String? abbreviation;
	String? id;
	String? name;
	int? type;
  
  EmployeeDetailEmployeeOrgMainOrgOrg();

  factory EmployeeDetailEmployeeOrgMainOrgOrg.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeeOrgMainOrgOrgFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeeOrgMainOrgOrgToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeeOrgMainOrgOrgParentLink {

	String? abbreviation;
	String? id;
	String? name;
	int? type;
  
  EmployeeDetailEmployeeOrgMainOrgOrgParentLink();

  factory EmployeeDetailEmployeeOrgMainOrgOrgParentLink.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeeOrgMainOrgOrgParentLinkFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeeOrgMainOrgOrgParentLinkToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeeOrgOrgList {

	String? id;
	int? identityType;
	EmployeeDetailEmployeeOrgOrgListIdentityTypePackage? identityTypePackage;
	int? mainFlag;
	EmployeeDetailEmployeeOrgOrgListOrg? org;
	List<EmployeeDetailEmployeeOrgOrgListOrgParentLink>? orgParentLink;
  
  EmployeeDetailEmployeeOrgOrgList();

  factory EmployeeDetailEmployeeOrgOrgList.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeeOrgOrgListFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeeOrgOrgListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeeOrgOrgListIdentityTypePackage {

	int? code;
	String? desc;
  
  EmployeeDetailEmployeeOrgOrgListIdentityTypePackage();

  factory EmployeeDetailEmployeeOrgOrgListIdentityTypePackage.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeeOrgOrgListIdentityTypePackageFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeeOrgOrgListIdentityTypePackageToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeeOrgOrgListOrg {

	String? abbreviation;
	String? id;
	String? name;
	int? type;
  
  EmployeeDetailEmployeeOrgOrgListOrg();

  factory EmployeeDetailEmployeeOrgOrgListOrg.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeeOrgOrgListOrgFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeeOrgOrgListOrgToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeeOrgOrgListOrgParentLink {

	String? abbreviation;
	String? id;
	String? name;
	int? type;
  
  EmployeeDetailEmployeeOrgOrgListOrgParentLink();

  factory EmployeeDetailEmployeeOrgOrgListOrgParentLink.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeeOrgOrgListOrgParentLinkFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeeOrgOrgListOrgParentLinkToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeePost {

	EmployeeDetailEmployeePostEmployeePost? employeePost;
	String? id;
  
  EmployeeDetailEmployeePost();

  factory EmployeeDetailEmployeePost.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeePostFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeePostToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeePostEmployeePost {

	String? id;
	String? name;
	int? type;
	EmployeeDetailEmployeePostEmployeePostTypePackage? typePackage;
  
  EmployeeDetailEmployeePostEmployeePost();

  factory EmployeeDetailEmployeePostEmployeePost.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeePostEmployeePostFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeePostEmployeePostToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeePostEmployeePostTypePackage {

	int? code;
	String? desc;
  
  EmployeeDetailEmployeePostEmployeePostTypePackage();

  factory EmployeeDetailEmployeePostEmployeePostTypePackage.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeePostEmployeePostTypePackageFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeePostEmployeePostTypePackageToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeePractice {

	String? id;
	String? practiceRegisterNumber;
	String? registerOrg;
	String? registerPubPic;
	int? registerStatus;
	EmployeeDetailEmployeePracticeRegisterStatusPackage? registerStatusPackage;
  
  EmployeeDetailEmployeePractice();

  factory EmployeeDetailEmployeePractice.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeePracticeFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeePracticeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeePracticeRegisterStatusPackage {

	int? code;
	String? desc;
  
  EmployeeDetailEmployeePracticeRegisterStatusPackage();

  factory EmployeeDetailEmployeePracticeRegisterStatusPackage.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeePracticeRegisterStatusPackageFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeePracticeRegisterStatusPackageToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EmployeeDetailEmployeePunish {

	int? punishNum;
	int? punishStatus;
  
  EmployeeDetailEmployeePunish();

  factory EmployeeDetailEmployeePunish.fromJson(Map<String, dynamic> json) => $EmployeeDetailEmployeePunishFromJson(json);

  Map<String, dynamic> toJson() => $EmployeeDetailEmployeePunishToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}