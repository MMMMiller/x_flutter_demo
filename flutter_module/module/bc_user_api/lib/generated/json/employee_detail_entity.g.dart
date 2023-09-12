import 'package:bc_user_api/generated/json/base/json_convert_content.dart';
import 'package:bc_user_api/model/employee_detail_entity.dart';

EmployeeDetailEntity $EmployeeDetailEntityFromJson(Map<String, dynamic> json) {
  final EmployeeDetailEntity employeeDetailEntity = EmployeeDetailEntity();
  final EmployeeDetailEmployeeAccount? employeeAccount = jsonConvert.convert<
      EmployeeDetailEmployeeAccount>(json['employeeAccount']);
  if (employeeAccount != null) {
    employeeDetailEntity.employeeAccount = employeeAccount;
  }
  final EmployeeDetailEmployeeAuth? employeeAuth = jsonConvert.convert<
      EmployeeDetailEmployeeAuth>(json['employeeAuth']);
  if (employeeAuth != null) {
    employeeDetailEntity.employeeAuth = employeeAuth;
  }
  final EmployeeDetailEmployeeBase? employeeBase = jsonConvert.convert<
      EmployeeDetailEmployeeBase>(json['employeeBase']);
  if (employeeBase != null) {
    employeeDetailEntity.employeeBase = employeeBase;
  }
  final EmployeeDetailEmployeeCommunication? employeeCommunication = jsonConvert
      .convert<EmployeeDetailEmployeeCommunication>(
      json['employeeCommunication']);
  if (employeeCommunication != null) {
    employeeDetailEntity.employeeCommunication = employeeCommunication;
  }
  final List<
      dynamic>? employeeGroupIdList = (json['employeeGroupIdList'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (employeeGroupIdList != null) {
    employeeDetailEntity.employeeGroupIdList = employeeGroupIdList;
  }
  final List<dynamic>? employeeGroupList = (json['employeeGroupList'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (employeeGroupList != null) {
    employeeDetailEntity.employeeGroupList = employeeGroupList;
  }
  final EmployeeDetailEmployeeLabour? employeeLabour = jsonConvert.convert<
      EmployeeDetailEmployeeLabour>(json['employeeLabour']);
  if (employeeLabour != null) {
    employeeDetailEntity.employeeLabour = employeeLabour;
  }
  final EmployeeDetailEmployeeOrg? employeeOrg = jsonConvert.convert<
      EmployeeDetailEmployeeOrg>(json['employeeOrg']);
  if (employeeOrg != null) {
    employeeDetailEntity.employeeOrg = employeeOrg;
  }
  final EmployeeDetailEmployeePost? employeePost = jsonConvert.convert<
      EmployeeDetailEmployeePost>(json['employeePost']);
  if (employeePost != null) {
    employeeDetailEntity.employeePost = employeePost;
  }
  final EmployeeDetailEmployeePractice? employeePractice = jsonConvert.convert<
      EmployeeDetailEmployeePractice>(json['employeePractice']);
  if (employeePractice != null) {
    employeeDetailEntity.employeePractice = employeePractice;
  }
  final EmployeeDetailEmployeePunish? employeePunish = jsonConvert.convert<
      EmployeeDetailEmployeePunish>(json['employeePunish']);
  if (employeePunish != null) {
    employeeDetailEntity.employeePunish = employeePunish;
  }
  return employeeDetailEntity;
}

Map<String, dynamic> $EmployeeDetailEntityToJson(EmployeeDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['employeeAccount'] = entity.employeeAccount?.toJson();
  data['employeeAuth'] = entity.employeeAuth?.toJson();
  data['employeeBase'] = entity.employeeBase?.toJson();
  data['employeeCommunication'] = entity.employeeCommunication?.toJson();
  data['employeeGroupIdList'] = entity.employeeGroupIdList;
  data['employeeGroupList'] = entity.employeeGroupList;
  data['employeeLabour'] = entity.employeeLabour?.toJson();
  data['employeeOrg'] = entity.employeeOrg?.toJson();
  data['employeePost'] = entity.employeePost?.toJson();
  data['employeePractice'] = entity.employeePractice?.toJson();
  data['employeePunish'] = entity.employeePunish?.toJson();
  return data;
}

extension EmployeeDetailEntityExtension on EmployeeDetailEntity {
  EmployeeDetailEntity copyWith({
    EmployeeDetailEmployeeAccount? employeeAccount,
    EmployeeDetailEmployeeAuth? employeeAuth,
    EmployeeDetailEmployeeBase? employeeBase,
    EmployeeDetailEmployeeCommunication? employeeCommunication,
    List<dynamic>? employeeGroupIdList,
    List<dynamic>? employeeGroupList,
    EmployeeDetailEmployeeLabour? employeeLabour,
    EmployeeDetailEmployeeOrg? employeeOrg,
    EmployeeDetailEmployeePost? employeePost,
    EmployeeDetailEmployeePractice? employeePractice,
    EmployeeDetailEmployeePunish? employeePunish,
  }) {
    return EmployeeDetailEntity()
      ..employeeAccount = employeeAccount ?? this.employeeAccount
      ..employeeAuth = employeeAuth ?? this.employeeAuth
      ..employeeBase = employeeBase ?? this.employeeBase
      ..employeeCommunication = employeeCommunication ??
          this.employeeCommunication
      ..employeeGroupIdList = employeeGroupIdList ?? this.employeeGroupIdList
      ..employeeGroupList = employeeGroupList ?? this.employeeGroupList
      ..employeeLabour = employeeLabour ?? this.employeeLabour
      ..employeeOrg = employeeOrg ?? this.employeeOrg
      ..employeePost = employeePost ?? this.employeePost
      ..employeePractice = employeePractice ?? this.employeePractice
      ..employeePunish = employeePunish ?? this.employeePunish;
  }
}

EmployeeDetailEmployeeAccount $EmployeeDetailEmployeeAccountFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeeAccount employeeDetailEmployeeAccount = EmployeeDetailEmployeeAccount();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    employeeDetailEmployeeAccount.id = id;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    employeeDetailEmployeeAccount.status = status;
  }
  final EmployeeDetailEmployeeAccountStatusPackage? statusPackage = jsonConvert
      .convert<EmployeeDetailEmployeeAccountStatusPackage>(
      json['statusPackage']);
  if (statusPackage != null) {
    employeeDetailEmployeeAccount.statusPackage = statusPackage;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    employeeDetailEmployeeAccount.username = username;
  }
  return employeeDetailEmployeeAccount;
}

Map<String, dynamic> $EmployeeDetailEmployeeAccountToJson(
    EmployeeDetailEmployeeAccount entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['status'] = entity.status;
  data['statusPackage'] = entity.statusPackage?.toJson();
  data['username'] = entity.username;
  return data;
}

extension EmployeeDetailEmployeeAccountExtension on EmployeeDetailEmployeeAccount {
  EmployeeDetailEmployeeAccount copyWith({
    String? id,
    int? status,
    EmployeeDetailEmployeeAccountStatusPackage? statusPackage,
    String? username,
  }) {
    return EmployeeDetailEmployeeAccount()
      ..id = id ?? this.id
      ..status = status ?? this.status
      ..statusPackage = statusPackage ?? this.statusPackage
      ..username = username ?? this.username;
  }
}

EmployeeDetailEmployeeAccountStatusPackage $EmployeeDetailEmployeeAccountStatusPackageFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeeAccountStatusPackage employeeDetailEmployeeAccountStatusPackage = EmployeeDetailEmployeeAccountStatusPackage();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    employeeDetailEmployeeAccountStatusPackage.code = code;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    employeeDetailEmployeeAccountStatusPackage.desc = desc;
  }
  return employeeDetailEmployeeAccountStatusPackage;
}

Map<String, dynamic> $EmployeeDetailEmployeeAccountStatusPackageToJson(
    EmployeeDetailEmployeeAccountStatusPackage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['desc'] = entity.desc;
  return data;
}

extension EmployeeDetailEmployeeAccountStatusPackageExtension on EmployeeDetailEmployeeAccountStatusPackage {
  EmployeeDetailEmployeeAccountStatusPackage copyWith({
    int? code,
    String? desc,
  }) {
    return EmployeeDetailEmployeeAccountStatusPackage()
      ..code = code ?? this.code
      ..desc = desc ?? this.desc;
  }
}

EmployeeDetailEmployeeAuth $EmployeeDetailEmployeeAuthFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeeAuth employeeDetailEmployeeAuth = EmployeeDetailEmployeeAuth();
  final List<String>? authRoleIdList = (json['authRoleIdList'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (authRoleIdList != null) {
    employeeDetailEmployeeAuth.authRoleIdList = authRoleIdList;
  }
  final List<
      EmployeeDetailEmployeeAuthAuthRoleList>? authRoleList = (json['authRoleList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<EmployeeDetailEmployeeAuthAuthRoleList>(
          e) as EmployeeDetailEmployeeAuthAuthRoleList).toList();
  if (authRoleList != null) {
    employeeDetailEmployeeAuth.authRoleList = authRoleList;
  }
  return employeeDetailEmployeeAuth;
}

Map<String, dynamic> $EmployeeDetailEmployeeAuthToJson(
    EmployeeDetailEmployeeAuth entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['authRoleIdList'] = entity.authRoleIdList;
  data['authRoleList'] = entity.authRoleList?.map((v) => v.toJson()).toList();
  return data;
}

extension EmployeeDetailEmployeeAuthExtension on EmployeeDetailEmployeeAuth {
  EmployeeDetailEmployeeAuth copyWith({
    List<String>? authRoleIdList,
    List<EmployeeDetailEmployeeAuthAuthRoleList>? authRoleList,
  }) {
    return EmployeeDetailEmployeeAuth()
      ..authRoleIdList = authRoleIdList ?? this.authRoleIdList
      ..authRoleList = authRoleList ?? this.authRoleList;
  }
}

EmployeeDetailEmployeeAuthAuthRoleList $EmployeeDetailEmployeeAuthAuthRoleListFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeeAuthAuthRoleList employeeDetailEmployeeAuthAuthRoleList = EmployeeDetailEmployeeAuthAuthRoleList();
  final bool? enableFlag = jsonConvert.convert<bool>(json['enableFlag']);
  if (enableFlag != null) {
    employeeDetailEmployeeAuthAuthRoleList.enableFlag = enableFlag;
  }
  final bool? extendsFlag = jsonConvert.convert<bool>(json['extendsFlag']);
  if (extendsFlag != null) {
    employeeDetailEmployeeAuthAuthRoleList.extendsFlag = extendsFlag;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    employeeDetailEmployeeAuthAuthRoleList.id = id;
  }
  final int? pattern = jsonConvert.convert<int>(json['pattern']);
  if (pattern != null) {
    employeeDetailEmployeeAuthAuthRoleList.pattern = pattern;
  }
  final String? roleName = jsonConvert.convert<String>(json['roleName']);
  if (roleName != null) {
    employeeDetailEmployeeAuthAuthRoleList.roleName = roleName;
  }
  final List<
      EmployeeDetailEmployeeAuthAuthRoleListSourceList>? sourceList = (json['sourceList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          EmployeeDetailEmployeeAuthAuthRoleListSourceList>(
          e) as EmployeeDetailEmployeeAuthAuthRoleListSourceList).toList();
  if (sourceList != null) {
    employeeDetailEmployeeAuthAuthRoleList.sourceList = sourceList;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    employeeDetailEmployeeAuthAuthRoleList.status = status;
  }
  return employeeDetailEmployeeAuthAuthRoleList;
}

Map<String, dynamic> $EmployeeDetailEmployeeAuthAuthRoleListToJson(
    EmployeeDetailEmployeeAuthAuthRoleList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['enableFlag'] = entity.enableFlag;
  data['extendsFlag'] = entity.extendsFlag;
  data['id'] = entity.id;
  data['pattern'] = entity.pattern;
  data['roleName'] = entity.roleName;
  data['sourceList'] = entity.sourceList?.map((v) => v.toJson()).toList();
  data['status'] = entity.status;
  return data;
}

extension EmployeeDetailEmployeeAuthAuthRoleListExtension on EmployeeDetailEmployeeAuthAuthRoleList {
  EmployeeDetailEmployeeAuthAuthRoleList copyWith({
    bool? enableFlag,
    bool? extendsFlag,
    String? id,
    int? pattern,
    String? roleName,
    List<EmployeeDetailEmployeeAuthAuthRoleListSourceList>? sourceList,
    int? status,
  }) {
    return EmployeeDetailEmployeeAuthAuthRoleList()
      ..enableFlag = enableFlag ?? this.enableFlag
      ..extendsFlag = extendsFlag ?? this.extendsFlag
      ..id = id ?? this.id
      ..pattern = pattern ?? this.pattern
      ..roleName = roleName ?? this.roleName
      ..sourceList = sourceList ?? this.sourceList
      ..status = status ?? this.status;
  }
}

EmployeeDetailEmployeeAuthAuthRoleListSourceList $EmployeeDetailEmployeeAuthAuthRoleListSourceListFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeeAuthAuthRoleListSourceList employeeDetailEmployeeAuthAuthRoleListSourceList = EmployeeDetailEmployeeAuthAuthRoleListSourceList();
  final String? refName = jsonConvert.convert<String>(json['refName']);
  if (refName != null) {
    employeeDetailEmployeeAuthAuthRoleListSourceList.refName = refName;
  }
  final String? sourceLabel = jsonConvert.convert<String>(json['sourceLabel']);
  if (sourceLabel != null) {
    employeeDetailEmployeeAuthAuthRoleListSourceList.sourceLabel = sourceLabel;
  }
  return employeeDetailEmployeeAuthAuthRoleListSourceList;
}

Map<String, dynamic> $EmployeeDetailEmployeeAuthAuthRoleListSourceListToJson(
    EmployeeDetailEmployeeAuthAuthRoleListSourceList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['refName'] = entity.refName;
  data['sourceLabel'] = entity.sourceLabel;
  return data;
}

extension EmployeeDetailEmployeeAuthAuthRoleListSourceListExtension on EmployeeDetailEmployeeAuthAuthRoleListSourceList {
  EmployeeDetailEmployeeAuthAuthRoleListSourceList copyWith({
    String? refName,
    String? sourceLabel,
  }) {
    return EmployeeDetailEmployeeAuthAuthRoleListSourceList()
      ..refName = refName ?? this.refName
      ..sourceLabel = sourceLabel ?? this.sourceLabel;
  }
}

EmployeeDetailEmployeeBase $EmployeeDetailEmployeeBaseFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeeBase employeeDetailEmployeeBase = EmployeeDetailEmployeeBase();
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    employeeDetailEmployeeBase.age = age;
  }
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    employeeDetailEmployeeBase.birthday = birthday;
  }
  final int? eduLevel = jsonConvert.convert<int>(json['eduLevel']);
  if (eduLevel != null) {
    employeeDetailEmployeeBase.eduLevel = eduLevel;
  }
  final EmployeeDetailEmployeeBaseEduLevelPackage? eduLevelPackage = jsonConvert
      .convert<EmployeeDetailEmployeeBaseEduLevelPackage>(
      json['eduLevelPackage']);
  if (eduLevelPackage != null) {
    employeeDetailEmployeeBase.eduLevelPackage = eduLevelPackage;
  }
  final String? emergencyContact = jsonConvert.convert<String>(
      json['emergencyContact']);
  if (emergencyContact != null) {
    employeeDetailEmployeeBase.emergencyContact = emergencyContact;
  }
  final String? emergencyPhone = jsonConvert.convert<String>(
      json['emergencyPhone']);
  if (emergencyPhone != null) {
    employeeDetailEmployeeBase.emergencyPhone = emergencyPhone;
  }
  final int? gender = jsonConvert.convert<int>(json['gender']);
  if (gender != null) {
    employeeDetailEmployeeBase.gender = gender;
  }
  final EmployeeDetailEmployeeBaseGenderPackage? genderPackage = jsonConvert
      .convert<EmployeeDetailEmployeeBaseGenderPackage>(json['genderPackage']);
  if (genderPackage != null) {
    employeeDetailEmployeeBase.genderPackage = genderPackage;
  }
  final String? homeAddress = jsonConvert.convert<String>(json['homeAddress']);
  if (homeAddress != null) {
    employeeDetailEmployeeBase.homeAddress = homeAddress;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    employeeDetailEmployeeBase.id = id;
  }
  final String? idCard = jsonConvert.convert<String>(json['idCard']);
  if (idCard != null) {
    employeeDetailEmployeeBase.idCard = idCard;
  }
  final String? idCardBack = jsonConvert.convert<String>(json['idCardBack']);
  if (idCardBack != null) {
    employeeDetailEmployeeBase.idCardBack = idCardBack;
  }
  final String? idCardFront = jsonConvert.convert<String>(json['idCardFront']);
  if (idCardFront != null) {
    employeeDetailEmployeeBase.idCardFront = idCardFront;
  }
  final int? jobStatus = jsonConvert.convert<int>(json['jobStatus']);
  if (jobStatus != null) {
    employeeDetailEmployeeBase.jobStatus = jobStatus;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    employeeDetailEmployeeBase.name = name;
  }
  final String? nation = jsonConvert.convert<String>(json['nation']);
  if (nation != null) {
    employeeDetailEmployeeBase.nation = nation;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    employeeDetailEmployeeBase.phone = phone;
  }
  final String? photo = jsonConvert.convert<String>(json['photo']);
  if (photo != null) {
    employeeDetailEmployeeBase.photo = photo;
  }
  final String? profile = jsonConvert.convert<String>(json['profile']);
  if (profile != null) {
    employeeDetailEmployeeBase.profile = profile;
  }
  final String? quitReason = jsonConvert.convert<String>(json['quitReason']);
  if (quitReason != null) {
    employeeDetailEmployeeBase.quitReason = quitReason;
  }
  return employeeDetailEmployeeBase;
}

Map<String, dynamic> $EmployeeDetailEmployeeBaseToJson(
    EmployeeDetailEmployeeBase entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['age'] = entity.age;
  data['birthday'] = entity.birthday;
  data['eduLevel'] = entity.eduLevel;
  data['eduLevelPackage'] = entity.eduLevelPackage?.toJson();
  data['emergencyContact'] = entity.emergencyContact;
  data['emergencyPhone'] = entity.emergencyPhone;
  data['gender'] = entity.gender;
  data['genderPackage'] = entity.genderPackage?.toJson();
  data['homeAddress'] = entity.homeAddress;
  data['id'] = entity.id;
  data['idCard'] = entity.idCard;
  data['idCardBack'] = entity.idCardBack;
  data['idCardFront'] = entity.idCardFront;
  data['jobStatus'] = entity.jobStatus;
  data['name'] = entity.name;
  data['nation'] = entity.nation;
  data['phone'] = entity.phone;
  data['photo'] = entity.photo;
  data['profile'] = entity.profile;
  data['quitReason'] = entity.quitReason;
  return data;
}

extension EmployeeDetailEmployeeBaseExtension on EmployeeDetailEmployeeBase {
  EmployeeDetailEmployeeBase copyWith({
    int? age,
    String? birthday,
    int? eduLevel,
    EmployeeDetailEmployeeBaseEduLevelPackage? eduLevelPackage,
    String? emergencyContact,
    String? emergencyPhone,
    int? gender,
    EmployeeDetailEmployeeBaseGenderPackage? genderPackage,
    String? homeAddress,
    String? id,
    String? idCard,
    String? idCardBack,
    String? idCardFront,
    int? jobStatus,
    String? name,
    String? nation,
    String? phone,
    String? photo,
    String? profile,
    String? quitReason,
  }) {
    return EmployeeDetailEmployeeBase()
      ..age = age ?? this.age
      ..birthday = birthday ?? this.birthday
      ..eduLevel = eduLevel ?? this.eduLevel
      ..eduLevelPackage = eduLevelPackage ?? this.eduLevelPackage
      ..emergencyContact = emergencyContact ?? this.emergencyContact
      ..emergencyPhone = emergencyPhone ?? this.emergencyPhone
      ..gender = gender ?? this.gender
      ..genderPackage = genderPackage ?? this.genderPackage
      ..homeAddress = homeAddress ?? this.homeAddress
      ..id = id ?? this.id
      ..idCard = idCard ?? this.idCard
      ..idCardBack = idCardBack ?? this.idCardBack
      ..idCardFront = idCardFront ?? this.idCardFront
      ..jobStatus = jobStatus ?? this.jobStatus
      ..name = name ?? this.name
      ..nation = nation ?? this.nation
      ..phone = phone ?? this.phone
      ..photo = photo ?? this.photo
      ..profile = profile ?? this.profile
      ..quitReason = quitReason ?? this.quitReason;
  }
}

EmployeeDetailEmployeeBaseEduLevelPackage $EmployeeDetailEmployeeBaseEduLevelPackageFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeeBaseEduLevelPackage employeeDetailEmployeeBaseEduLevelPackage = EmployeeDetailEmployeeBaseEduLevelPackage();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    employeeDetailEmployeeBaseEduLevelPackage.code = code;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    employeeDetailEmployeeBaseEduLevelPackage.desc = desc;
  }
  return employeeDetailEmployeeBaseEduLevelPackage;
}

Map<String, dynamic> $EmployeeDetailEmployeeBaseEduLevelPackageToJson(
    EmployeeDetailEmployeeBaseEduLevelPackage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['desc'] = entity.desc;
  return data;
}

extension EmployeeDetailEmployeeBaseEduLevelPackageExtension on EmployeeDetailEmployeeBaseEduLevelPackage {
  EmployeeDetailEmployeeBaseEduLevelPackage copyWith({
    int? code,
    String? desc,
  }) {
    return EmployeeDetailEmployeeBaseEduLevelPackage()
      ..code = code ?? this.code
      ..desc = desc ?? this.desc;
  }
}

EmployeeDetailEmployeeBaseGenderPackage $EmployeeDetailEmployeeBaseGenderPackageFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeeBaseGenderPackage employeeDetailEmployeeBaseGenderPackage = EmployeeDetailEmployeeBaseGenderPackage();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    employeeDetailEmployeeBaseGenderPackage.code = code;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    employeeDetailEmployeeBaseGenderPackage.desc = desc;
  }
  return employeeDetailEmployeeBaseGenderPackage;
}

Map<String, dynamic> $EmployeeDetailEmployeeBaseGenderPackageToJson(
    EmployeeDetailEmployeeBaseGenderPackage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['desc'] = entity.desc;
  return data;
}

extension EmployeeDetailEmployeeBaseGenderPackageExtension on EmployeeDetailEmployeeBaseGenderPackage {
  EmployeeDetailEmployeeBaseGenderPackage copyWith({
    int? code,
    String? desc,
  }) {
    return EmployeeDetailEmployeeBaseGenderPackage()
      ..code = code ?? this.code
      ..desc = desc ?? this.desc;
  }
}

EmployeeDetailEmployeeCommunication $EmployeeDetailEmployeeCommunicationFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeeCommunication employeeDetailEmployeeCommunication = EmployeeDetailEmployeeCommunication();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    employeeDetailEmployeeCommunication.id = id;
  }
  final String? officeTel = jsonConvert.convert<String>(json['officeTel']);
  if (officeTel != null) {
    employeeDetailEmployeeCommunication.officeTel = officeTel;
  }
  final String? workEmail = jsonConvert.convert<String>(json['workEmail']);
  if (workEmail != null) {
    employeeDetailEmployeeCommunication.workEmail = workEmail;
  }
  final String? workQq = jsonConvert.convert<String>(json['workQq']);
  if (workQq != null) {
    employeeDetailEmployeeCommunication.workQq = workQq;
  }
  final String? workWechat = jsonConvert.convert<String>(json['workWechat']);
  if (workWechat != null) {
    employeeDetailEmployeeCommunication.workWechat = workWechat;
  }
  return employeeDetailEmployeeCommunication;
}

Map<String, dynamic> $EmployeeDetailEmployeeCommunicationToJson(
    EmployeeDetailEmployeeCommunication entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['officeTel'] = entity.officeTel;
  data['workEmail'] = entity.workEmail;
  data['workQq'] = entity.workQq;
  data['workWechat'] = entity.workWechat;
  return data;
}

extension EmployeeDetailEmployeeCommunicationExtension on EmployeeDetailEmployeeCommunication {
  EmployeeDetailEmployeeCommunication copyWith({
    String? id,
    String? officeTel,
    String? workEmail,
    String? workQq,
    String? workWechat,
  }) {
    return EmployeeDetailEmployeeCommunication()
      ..id = id ?? this.id
      ..officeTel = officeTel ?? this.officeTel
      ..workEmail = workEmail ?? this.workEmail
      ..workQq = workQq ?? this.workQq
      ..workWechat = workWechat ?? this.workWechat;
  }
}

EmployeeDetailEmployeeLabour $EmployeeDetailEmployeeLabourFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeeLabour employeeDetailEmployeeLabour = EmployeeDetailEmployeeLabour();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    employeeDetailEmployeeLabour.id = id;
  }
  final String? jobNumber = jsonConvert.convert<String>(json['jobNumber']);
  if (jobNumber != null) {
    employeeDetailEmployeeLabour.jobNumber = jobNumber;
  }
  final String? laborContract = jsonConvert.convert<String>(
      json['laborContract']);
  if (laborContract != null) {
    employeeDetailEmployeeLabour.laborContract = laborContract;
  }
  final String? laborContractName = jsonConvert.convert<String>(
      json['laborContractName']);
  if (laborContractName != null) {
    employeeDetailEmployeeLabour.laborContractName = laborContractName;
  }
  final String? laborContractNumber = jsonConvert.convert<String>(
      json['laborContractNumber']);
  if (laborContractNumber != null) {
    employeeDetailEmployeeLabour.laborContractNumber = laborContractNumber;
  }
  final String? workAddress = jsonConvert.convert<String>(json['workAddress']);
  if (workAddress != null) {
    employeeDetailEmployeeLabour.workAddress = workAddress;
  }
  return employeeDetailEmployeeLabour;
}

Map<String, dynamic> $EmployeeDetailEmployeeLabourToJson(
    EmployeeDetailEmployeeLabour entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['jobNumber'] = entity.jobNumber;
  data['laborContract'] = entity.laborContract;
  data['laborContractName'] = entity.laborContractName;
  data['laborContractNumber'] = entity.laborContractNumber;
  data['workAddress'] = entity.workAddress;
  return data;
}

extension EmployeeDetailEmployeeLabourExtension on EmployeeDetailEmployeeLabour {
  EmployeeDetailEmployeeLabour copyWith({
    String? id,
    String? jobNumber,
    String? laborContract,
    String? laborContractName,
    String? laborContractNumber,
    String? workAddress,
  }) {
    return EmployeeDetailEmployeeLabour()
      ..id = id ?? this.id
      ..jobNumber = jobNumber ?? this.jobNumber
      ..laborContract = laborContract ?? this.laborContract
      ..laborContractName = laborContractName ?? this.laborContractName
      ..laborContractNumber = laborContractNumber ?? this.laborContractNumber
      ..workAddress = workAddress ?? this.workAddress;
  }
}

EmployeeDetailEmployeeOrg $EmployeeDetailEmployeeOrgFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeeOrg employeeDetailEmployeeOrg = EmployeeDetailEmployeeOrg();
  final EmployeeDetailEmployeeOrgMainOrg? mainOrg = jsonConvert.convert<
      EmployeeDetailEmployeeOrgMainOrg>(json['mainOrg']);
  if (mainOrg != null) {
    employeeDetailEmployeeOrg.mainOrg = mainOrg;
  }
  final String? mainOrgId = jsonConvert.convert<String>(json['mainOrgId']);
  if (mainOrgId != null) {
    employeeDetailEmployeeOrg.mainOrgId = mainOrgId;
  }
  final List<String>? orgIdList = (json['orgIdList'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (orgIdList != null) {
    employeeDetailEmployeeOrg.orgIdList = orgIdList;
  }
  final List<
      EmployeeDetailEmployeeOrgOrgList>? orgList = (json['orgList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<EmployeeDetailEmployeeOrgOrgList>(
          e) as EmployeeDetailEmployeeOrgOrgList).toList();
  if (orgList != null) {
    employeeDetailEmployeeOrg.orgList = orgList;
  }
  return employeeDetailEmployeeOrg;
}

Map<String, dynamic> $EmployeeDetailEmployeeOrgToJson(
    EmployeeDetailEmployeeOrg entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['mainOrg'] = entity.mainOrg?.toJson();
  data['mainOrgId'] = entity.mainOrgId;
  data['orgIdList'] = entity.orgIdList;
  data['orgList'] = entity.orgList?.map((v) => v.toJson()).toList();
  return data;
}

extension EmployeeDetailEmployeeOrgExtension on EmployeeDetailEmployeeOrg {
  EmployeeDetailEmployeeOrg copyWith({
    EmployeeDetailEmployeeOrgMainOrg? mainOrg,
    String? mainOrgId,
    List<String>? orgIdList,
    List<EmployeeDetailEmployeeOrgOrgList>? orgList,
  }) {
    return EmployeeDetailEmployeeOrg()
      ..mainOrg = mainOrg ?? this.mainOrg
      ..mainOrgId = mainOrgId ?? this.mainOrgId
      ..orgIdList = orgIdList ?? this.orgIdList
      ..orgList = orgList ?? this.orgList;
  }
}

EmployeeDetailEmployeeOrgMainOrg $EmployeeDetailEmployeeOrgMainOrgFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeeOrgMainOrg employeeDetailEmployeeOrgMainOrg = EmployeeDetailEmployeeOrgMainOrg();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    employeeDetailEmployeeOrgMainOrg.id = id;
  }
  final int? identityType = jsonConvert.convert<int>(json['identityType']);
  if (identityType != null) {
    employeeDetailEmployeeOrgMainOrg.identityType = identityType;
  }
  final EmployeeDetailEmployeeOrgMainOrgIdentityTypePackage? identityTypePackage = jsonConvert
      .convert<EmployeeDetailEmployeeOrgMainOrgIdentityTypePackage>(
      json['identityTypePackage']);
  if (identityTypePackage != null) {
    employeeDetailEmployeeOrgMainOrg.identityTypePackage = identityTypePackage;
  }
  final int? mainFlag = jsonConvert.convert<int>(json['mainFlag']);
  if (mainFlag != null) {
    employeeDetailEmployeeOrgMainOrg.mainFlag = mainFlag;
  }
  final EmployeeDetailEmployeeOrgMainOrgOrg? org = jsonConvert.convert<
      EmployeeDetailEmployeeOrgMainOrgOrg>(json['org']);
  if (org != null) {
    employeeDetailEmployeeOrgMainOrg.org = org;
  }
  final List<
      EmployeeDetailEmployeeOrgMainOrgOrgParentLink>? orgParentLink = (json['orgParentLink'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          EmployeeDetailEmployeeOrgMainOrgOrgParentLink>(
          e) as EmployeeDetailEmployeeOrgMainOrgOrgParentLink).toList();
  if (orgParentLink != null) {
    employeeDetailEmployeeOrgMainOrg.orgParentLink = orgParentLink;
  }
  return employeeDetailEmployeeOrgMainOrg;
}

Map<String, dynamic> $EmployeeDetailEmployeeOrgMainOrgToJson(
    EmployeeDetailEmployeeOrgMainOrg entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['identityType'] = entity.identityType;
  data['identityTypePackage'] = entity.identityTypePackage?.toJson();
  data['mainFlag'] = entity.mainFlag;
  data['org'] = entity.org?.toJson();
  data['orgParentLink'] = entity.orgParentLink?.map((v) => v.toJson()).toList();
  return data;
}

extension EmployeeDetailEmployeeOrgMainOrgExtension on EmployeeDetailEmployeeOrgMainOrg {
  EmployeeDetailEmployeeOrgMainOrg copyWith({
    String? id,
    int? identityType,
    EmployeeDetailEmployeeOrgMainOrgIdentityTypePackage? identityTypePackage,
    int? mainFlag,
    EmployeeDetailEmployeeOrgMainOrgOrg? org,
    List<EmployeeDetailEmployeeOrgMainOrgOrgParentLink>? orgParentLink,
  }) {
    return EmployeeDetailEmployeeOrgMainOrg()
      ..id = id ?? this.id
      ..identityType = identityType ?? this.identityType
      ..identityTypePackage = identityTypePackage ?? this.identityTypePackage
      ..mainFlag = mainFlag ?? this.mainFlag
      ..org = org ?? this.org
      ..orgParentLink = orgParentLink ?? this.orgParentLink;
  }
}

EmployeeDetailEmployeeOrgMainOrgIdentityTypePackage $EmployeeDetailEmployeeOrgMainOrgIdentityTypePackageFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeeOrgMainOrgIdentityTypePackage employeeDetailEmployeeOrgMainOrgIdentityTypePackage = EmployeeDetailEmployeeOrgMainOrgIdentityTypePackage();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    employeeDetailEmployeeOrgMainOrgIdentityTypePackage.code = code;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    employeeDetailEmployeeOrgMainOrgIdentityTypePackage.desc = desc;
  }
  return employeeDetailEmployeeOrgMainOrgIdentityTypePackage;
}

Map<String, dynamic> $EmployeeDetailEmployeeOrgMainOrgIdentityTypePackageToJson(
    EmployeeDetailEmployeeOrgMainOrgIdentityTypePackage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['desc'] = entity.desc;
  return data;
}

extension EmployeeDetailEmployeeOrgMainOrgIdentityTypePackageExtension on EmployeeDetailEmployeeOrgMainOrgIdentityTypePackage {
  EmployeeDetailEmployeeOrgMainOrgIdentityTypePackage copyWith({
    int? code,
    String? desc,
  }) {
    return EmployeeDetailEmployeeOrgMainOrgIdentityTypePackage()
      ..code = code ?? this.code
      ..desc = desc ?? this.desc;
  }
}

EmployeeDetailEmployeeOrgMainOrgOrg $EmployeeDetailEmployeeOrgMainOrgOrgFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeeOrgMainOrgOrg employeeDetailEmployeeOrgMainOrgOrg = EmployeeDetailEmployeeOrgMainOrgOrg();
  final String? abbreviation = jsonConvert.convert<String>(
      json['abbreviation']);
  if (abbreviation != null) {
    employeeDetailEmployeeOrgMainOrgOrg.abbreviation = abbreviation;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    employeeDetailEmployeeOrgMainOrgOrg.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    employeeDetailEmployeeOrgMainOrgOrg.name = name;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    employeeDetailEmployeeOrgMainOrgOrg.type = type;
  }
  return employeeDetailEmployeeOrgMainOrgOrg;
}

Map<String, dynamic> $EmployeeDetailEmployeeOrgMainOrgOrgToJson(
    EmployeeDetailEmployeeOrgMainOrgOrg entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['abbreviation'] = entity.abbreviation;
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['type'] = entity.type;
  return data;
}

extension EmployeeDetailEmployeeOrgMainOrgOrgExtension on EmployeeDetailEmployeeOrgMainOrgOrg {
  EmployeeDetailEmployeeOrgMainOrgOrg copyWith({
    String? abbreviation,
    String? id,
    String? name,
    int? type,
  }) {
    return EmployeeDetailEmployeeOrgMainOrgOrg()
      ..abbreviation = abbreviation ?? this.abbreviation
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..type = type ?? this.type;
  }
}

EmployeeDetailEmployeeOrgMainOrgOrgParentLink $EmployeeDetailEmployeeOrgMainOrgOrgParentLinkFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeeOrgMainOrgOrgParentLink employeeDetailEmployeeOrgMainOrgOrgParentLink = EmployeeDetailEmployeeOrgMainOrgOrgParentLink();
  final String? abbreviation = jsonConvert.convert<String>(
      json['abbreviation']);
  if (abbreviation != null) {
    employeeDetailEmployeeOrgMainOrgOrgParentLink.abbreviation = abbreviation;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    employeeDetailEmployeeOrgMainOrgOrgParentLink.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    employeeDetailEmployeeOrgMainOrgOrgParentLink.name = name;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    employeeDetailEmployeeOrgMainOrgOrgParentLink.type = type;
  }
  return employeeDetailEmployeeOrgMainOrgOrgParentLink;
}

Map<String, dynamic> $EmployeeDetailEmployeeOrgMainOrgOrgParentLinkToJson(
    EmployeeDetailEmployeeOrgMainOrgOrgParentLink entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['abbreviation'] = entity.abbreviation;
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['type'] = entity.type;
  return data;
}

extension EmployeeDetailEmployeeOrgMainOrgOrgParentLinkExtension on EmployeeDetailEmployeeOrgMainOrgOrgParentLink {
  EmployeeDetailEmployeeOrgMainOrgOrgParentLink copyWith({
    String? abbreviation,
    String? id,
    String? name,
    int? type,
  }) {
    return EmployeeDetailEmployeeOrgMainOrgOrgParentLink()
      ..abbreviation = abbreviation ?? this.abbreviation
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..type = type ?? this.type;
  }
}

EmployeeDetailEmployeeOrgOrgList $EmployeeDetailEmployeeOrgOrgListFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeeOrgOrgList employeeDetailEmployeeOrgOrgList = EmployeeDetailEmployeeOrgOrgList();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    employeeDetailEmployeeOrgOrgList.id = id;
  }
  final int? identityType = jsonConvert.convert<int>(json['identityType']);
  if (identityType != null) {
    employeeDetailEmployeeOrgOrgList.identityType = identityType;
  }
  final EmployeeDetailEmployeeOrgOrgListIdentityTypePackage? identityTypePackage = jsonConvert
      .convert<EmployeeDetailEmployeeOrgOrgListIdentityTypePackage>(
      json['identityTypePackage']);
  if (identityTypePackage != null) {
    employeeDetailEmployeeOrgOrgList.identityTypePackage = identityTypePackage;
  }
  final int? mainFlag = jsonConvert.convert<int>(json['mainFlag']);
  if (mainFlag != null) {
    employeeDetailEmployeeOrgOrgList.mainFlag = mainFlag;
  }
  final EmployeeDetailEmployeeOrgOrgListOrg? org = jsonConvert.convert<
      EmployeeDetailEmployeeOrgOrgListOrg>(json['org']);
  if (org != null) {
    employeeDetailEmployeeOrgOrgList.org = org;
  }
  final List<
      EmployeeDetailEmployeeOrgOrgListOrgParentLink>? orgParentLink = (json['orgParentLink'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          EmployeeDetailEmployeeOrgOrgListOrgParentLink>(
          e) as EmployeeDetailEmployeeOrgOrgListOrgParentLink).toList();
  if (orgParentLink != null) {
    employeeDetailEmployeeOrgOrgList.orgParentLink = orgParentLink;
  }
  return employeeDetailEmployeeOrgOrgList;
}

Map<String, dynamic> $EmployeeDetailEmployeeOrgOrgListToJson(
    EmployeeDetailEmployeeOrgOrgList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['identityType'] = entity.identityType;
  data['identityTypePackage'] = entity.identityTypePackage?.toJson();
  data['mainFlag'] = entity.mainFlag;
  data['org'] = entity.org?.toJson();
  data['orgParentLink'] = entity.orgParentLink?.map((v) => v.toJson()).toList();
  return data;
}

extension EmployeeDetailEmployeeOrgOrgListExtension on EmployeeDetailEmployeeOrgOrgList {
  EmployeeDetailEmployeeOrgOrgList copyWith({
    String? id,
    int? identityType,
    EmployeeDetailEmployeeOrgOrgListIdentityTypePackage? identityTypePackage,
    int? mainFlag,
    EmployeeDetailEmployeeOrgOrgListOrg? org,
    List<EmployeeDetailEmployeeOrgOrgListOrgParentLink>? orgParentLink,
  }) {
    return EmployeeDetailEmployeeOrgOrgList()
      ..id = id ?? this.id
      ..identityType = identityType ?? this.identityType
      ..identityTypePackage = identityTypePackage ?? this.identityTypePackage
      ..mainFlag = mainFlag ?? this.mainFlag
      ..org = org ?? this.org
      ..orgParentLink = orgParentLink ?? this.orgParentLink;
  }
}

EmployeeDetailEmployeeOrgOrgListIdentityTypePackage $EmployeeDetailEmployeeOrgOrgListIdentityTypePackageFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeeOrgOrgListIdentityTypePackage employeeDetailEmployeeOrgOrgListIdentityTypePackage = EmployeeDetailEmployeeOrgOrgListIdentityTypePackage();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    employeeDetailEmployeeOrgOrgListIdentityTypePackage.code = code;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    employeeDetailEmployeeOrgOrgListIdentityTypePackage.desc = desc;
  }
  return employeeDetailEmployeeOrgOrgListIdentityTypePackage;
}

Map<String, dynamic> $EmployeeDetailEmployeeOrgOrgListIdentityTypePackageToJson(
    EmployeeDetailEmployeeOrgOrgListIdentityTypePackage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['desc'] = entity.desc;
  return data;
}

extension EmployeeDetailEmployeeOrgOrgListIdentityTypePackageExtension on EmployeeDetailEmployeeOrgOrgListIdentityTypePackage {
  EmployeeDetailEmployeeOrgOrgListIdentityTypePackage copyWith({
    int? code,
    String? desc,
  }) {
    return EmployeeDetailEmployeeOrgOrgListIdentityTypePackage()
      ..code = code ?? this.code
      ..desc = desc ?? this.desc;
  }
}

EmployeeDetailEmployeeOrgOrgListOrg $EmployeeDetailEmployeeOrgOrgListOrgFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeeOrgOrgListOrg employeeDetailEmployeeOrgOrgListOrg = EmployeeDetailEmployeeOrgOrgListOrg();
  final String? abbreviation = jsonConvert.convert<String>(
      json['abbreviation']);
  if (abbreviation != null) {
    employeeDetailEmployeeOrgOrgListOrg.abbreviation = abbreviation;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    employeeDetailEmployeeOrgOrgListOrg.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    employeeDetailEmployeeOrgOrgListOrg.name = name;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    employeeDetailEmployeeOrgOrgListOrg.type = type;
  }
  return employeeDetailEmployeeOrgOrgListOrg;
}

Map<String, dynamic> $EmployeeDetailEmployeeOrgOrgListOrgToJson(
    EmployeeDetailEmployeeOrgOrgListOrg entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['abbreviation'] = entity.abbreviation;
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['type'] = entity.type;
  return data;
}

extension EmployeeDetailEmployeeOrgOrgListOrgExtension on EmployeeDetailEmployeeOrgOrgListOrg {
  EmployeeDetailEmployeeOrgOrgListOrg copyWith({
    String? abbreviation,
    String? id,
    String? name,
    int? type,
  }) {
    return EmployeeDetailEmployeeOrgOrgListOrg()
      ..abbreviation = abbreviation ?? this.abbreviation
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..type = type ?? this.type;
  }
}

EmployeeDetailEmployeeOrgOrgListOrgParentLink $EmployeeDetailEmployeeOrgOrgListOrgParentLinkFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeeOrgOrgListOrgParentLink employeeDetailEmployeeOrgOrgListOrgParentLink = EmployeeDetailEmployeeOrgOrgListOrgParentLink();
  final String? abbreviation = jsonConvert.convert<String>(
      json['abbreviation']);
  if (abbreviation != null) {
    employeeDetailEmployeeOrgOrgListOrgParentLink.abbreviation = abbreviation;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    employeeDetailEmployeeOrgOrgListOrgParentLink.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    employeeDetailEmployeeOrgOrgListOrgParentLink.name = name;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    employeeDetailEmployeeOrgOrgListOrgParentLink.type = type;
  }
  return employeeDetailEmployeeOrgOrgListOrgParentLink;
}

Map<String, dynamic> $EmployeeDetailEmployeeOrgOrgListOrgParentLinkToJson(
    EmployeeDetailEmployeeOrgOrgListOrgParentLink entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['abbreviation'] = entity.abbreviation;
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['type'] = entity.type;
  return data;
}

extension EmployeeDetailEmployeeOrgOrgListOrgParentLinkExtension on EmployeeDetailEmployeeOrgOrgListOrgParentLink {
  EmployeeDetailEmployeeOrgOrgListOrgParentLink copyWith({
    String? abbreviation,
    String? id,
    String? name,
    int? type,
  }) {
    return EmployeeDetailEmployeeOrgOrgListOrgParentLink()
      ..abbreviation = abbreviation ?? this.abbreviation
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..type = type ?? this.type;
  }
}

EmployeeDetailEmployeePost $EmployeeDetailEmployeePostFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeePost employeeDetailEmployeePost = EmployeeDetailEmployeePost();
  final EmployeeDetailEmployeePostEmployeePost? employeePost = jsonConvert
      .convert<EmployeeDetailEmployeePostEmployeePost>(json['employeePost']);
  if (employeePost != null) {
    employeeDetailEmployeePost.employeePost = employeePost;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    employeeDetailEmployeePost.id = id;
  }
  return employeeDetailEmployeePost;
}

Map<String, dynamic> $EmployeeDetailEmployeePostToJson(
    EmployeeDetailEmployeePost entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['employeePost'] = entity.employeePost?.toJson();
  data['id'] = entity.id;
  return data;
}

extension EmployeeDetailEmployeePostExtension on EmployeeDetailEmployeePost {
  EmployeeDetailEmployeePost copyWith({
    EmployeeDetailEmployeePostEmployeePost? employeePost,
    String? id,
  }) {
    return EmployeeDetailEmployeePost()
      ..employeePost = employeePost ?? this.employeePost
      ..id = id ?? this.id;
  }
}

EmployeeDetailEmployeePostEmployeePost $EmployeeDetailEmployeePostEmployeePostFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeePostEmployeePost employeeDetailEmployeePostEmployeePost = EmployeeDetailEmployeePostEmployeePost();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    employeeDetailEmployeePostEmployeePost.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    employeeDetailEmployeePostEmployeePost.name = name;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    employeeDetailEmployeePostEmployeePost.type = type;
  }
  final EmployeeDetailEmployeePostEmployeePostTypePackage? typePackage = jsonConvert
      .convert<EmployeeDetailEmployeePostEmployeePostTypePackage>(
      json['typePackage']);
  if (typePackage != null) {
    employeeDetailEmployeePostEmployeePost.typePackage = typePackage;
  }
  return employeeDetailEmployeePostEmployeePost;
}

Map<String, dynamic> $EmployeeDetailEmployeePostEmployeePostToJson(
    EmployeeDetailEmployeePostEmployeePost entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['type'] = entity.type;
  data['typePackage'] = entity.typePackage?.toJson();
  return data;
}

extension EmployeeDetailEmployeePostEmployeePostExtension on EmployeeDetailEmployeePostEmployeePost {
  EmployeeDetailEmployeePostEmployeePost copyWith({
    String? id,
    String? name,
    int? type,
    EmployeeDetailEmployeePostEmployeePostTypePackage? typePackage,
  }) {
    return EmployeeDetailEmployeePostEmployeePost()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..type = type ?? this.type
      ..typePackage = typePackage ?? this.typePackage;
  }
}

EmployeeDetailEmployeePostEmployeePostTypePackage $EmployeeDetailEmployeePostEmployeePostTypePackageFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeePostEmployeePostTypePackage employeeDetailEmployeePostEmployeePostTypePackage = EmployeeDetailEmployeePostEmployeePostTypePackage();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    employeeDetailEmployeePostEmployeePostTypePackage.code = code;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    employeeDetailEmployeePostEmployeePostTypePackage.desc = desc;
  }
  return employeeDetailEmployeePostEmployeePostTypePackage;
}

Map<String, dynamic> $EmployeeDetailEmployeePostEmployeePostTypePackageToJson(
    EmployeeDetailEmployeePostEmployeePostTypePackage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['desc'] = entity.desc;
  return data;
}

extension EmployeeDetailEmployeePostEmployeePostTypePackageExtension on EmployeeDetailEmployeePostEmployeePostTypePackage {
  EmployeeDetailEmployeePostEmployeePostTypePackage copyWith({
    int? code,
    String? desc,
  }) {
    return EmployeeDetailEmployeePostEmployeePostTypePackage()
      ..code = code ?? this.code
      ..desc = desc ?? this.desc;
  }
}

EmployeeDetailEmployeePractice $EmployeeDetailEmployeePracticeFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeePractice employeeDetailEmployeePractice = EmployeeDetailEmployeePractice();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    employeeDetailEmployeePractice.id = id;
  }
  final String? practiceRegisterNumber = jsonConvert.convert<String>(
      json['practiceRegisterNumber']);
  if (practiceRegisterNumber != null) {
    employeeDetailEmployeePractice.practiceRegisterNumber =
        practiceRegisterNumber;
  }
  final String? registerOrg = jsonConvert.convert<String>(json['registerOrg']);
  if (registerOrg != null) {
    employeeDetailEmployeePractice.registerOrg = registerOrg;
  }
  final String? registerPubPic = jsonConvert.convert<String>(
      json['registerPubPic']);
  if (registerPubPic != null) {
    employeeDetailEmployeePractice.registerPubPic = registerPubPic;
  }
  final int? registerStatus = jsonConvert.convert<int>(json['registerStatus']);
  if (registerStatus != null) {
    employeeDetailEmployeePractice.registerStatus = registerStatus;
  }
  final EmployeeDetailEmployeePracticeRegisterStatusPackage? registerStatusPackage = jsonConvert
      .convert<EmployeeDetailEmployeePracticeRegisterStatusPackage>(
      json['registerStatusPackage']);
  if (registerStatusPackage != null) {
    employeeDetailEmployeePractice.registerStatusPackage =
        registerStatusPackage;
  }
  return employeeDetailEmployeePractice;
}

Map<String, dynamic> $EmployeeDetailEmployeePracticeToJson(
    EmployeeDetailEmployeePractice entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['practiceRegisterNumber'] = entity.practiceRegisterNumber;
  data['registerOrg'] = entity.registerOrg;
  data['registerPubPic'] = entity.registerPubPic;
  data['registerStatus'] = entity.registerStatus;
  data['registerStatusPackage'] = entity.registerStatusPackage?.toJson();
  return data;
}

extension EmployeeDetailEmployeePracticeExtension on EmployeeDetailEmployeePractice {
  EmployeeDetailEmployeePractice copyWith({
    String? id,
    String? practiceRegisterNumber,
    String? registerOrg,
    String? registerPubPic,
    int? registerStatus,
    EmployeeDetailEmployeePracticeRegisterStatusPackage? registerStatusPackage,
  }) {
    return EmployeeDetailEmployeePractice()
      ..id = id ?? this.id
      ..practiceRegisterNumber = practiceRegisterNumber ??
          this.practiceRegisterNumber
      ..registerOrg = registerOrg ?? this.registerOrg
      ..registerPubPic = registerPubPic ?? this.registerPubPic
      ..registerStatus = registerStatus ?? this.registerStatus
      ..registerStatusPackage = registerStatusPackage ??
          this.registerStatusPackage;
  }
}

EmployeeDetailEmployeePracticeRegisterStatusPackage $EmployeeDetailEmployeePracticeRegisterStatusPackageFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeePracticeRegisterStatusPackage employeeDetailEmployeePracticeRegisterStatusPackage = EmployeeDetailEmployeePracticeRegisterStatusPackage();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    employeeDetailEmployeePracticeRegisterStatusPackage.code = code;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    employeeDetailEmployeePracticeRegisterStatusPackage.desc = desc;
  }
  return employeeDetailEmployeePracticeRegisterStatusPackage;
}

Map<String, dynamic> $EmployeeDetailEmployeePracticeRegisterStatusPackageToJson(
    EmployeeDetailEmployeePracticeRegisterStatusPackage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['desc'] = entity.desc;
  return data;
}

extension EmployeeDetailEmployeePracticeRegisterStatusPackageExtension on EmployeeDetailEmployeePracticeRegisterStatusPackage {
  EmployeeDetailEmployeePracticeRegisterStatusPackage copyWith({
    int? code,
    String? desc,
  }) {
    return EmployeeDetailEmployeePracticeRegisterStatusPackage()
      ..code = code ?? this.code
      ..desc = desc ?? this.desc;
  }
}

EmployeeDetailEmployeePunish $EmployeeDetailEmployeePunishFromJson(
    Map<String, dynamic> json) {
  final EmployeeDetailEmployeePunish employeeDetailEmployeePunish = EmployeeDetailEmployeePunish();
  final int? punishNum = jsonConvert.convert<int>(json['punishNum']);
  if (punishNum != null) {
    employeeDetailEmployeePunish.punishNum = punishNum;
  }
  final int? punishStatus = jsonConvert.convert<int>(json['punishStatus']);
  if (punishStatus != null) {
    employeeDetailEmployeePunish.punishStatus = punishStatus;
  }
  return employeeDetailEmployeePunish;
}

Map<String, dynamic> $EmployeeDetailEmployeePunishToJson(
    EmployeeDetailEmployeePunish entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['punishNum'] = entity.punishNum;
  data['punishStatus'] = entity.punishStatus;
  return data;
}

extension EmployeeDetailEmployeePunishExtension on EmployeeDetailEmployeePunish {
  EmployeeDetailEmployeePunish copyWith({
    int? punishNum,
    int? punishStatus,
  }) {
    return EmployeeDetailEmployeePunish()
      ..punishNum = punishNum ?? this.punishNum
      ..punishStatus = punishStatus ?? this.punishStatus;
  }
}