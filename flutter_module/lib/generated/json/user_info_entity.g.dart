import 'package:flutter_module/generated/json/base/json_convert_content.dart';
import 'package:flutter_module/domain/user/model/user_info_entity.dart';

UserInfoEntity $UserInfoEntityFromJson(Map<String, dynamic> json) {
  final UserInfoEntity userInfoEntity = UserInfoEntity();
  final UserInfoEmployeeAccount? employeeAccount = jsonConvert.convert<
      UserInfoEmployeeAccount>(json['employeeAccount']);
  if (employeeAccount != null) {
    userInfoEntity.employeeAccount = employeeAccount;
  }
  final UserInfoEmployeeBase? employeeBase = jsonConvert.convert<
      UserInfoEmployeeBase>(json['employeeBase']);
  if (employeeBase != null) {
    userInfoEntity.employeeBase = employeeBase;
  }
  final UserInfoEmployeeOrg? employeeOrg = jsonConvert.convert<
      UserInfoEmployeeOrg>(json['employeeOrg']);
  if (employeeOrg != null) {
    userInfoEntity.employeeOrg = employeeOrg;
  }
  return userInfoEntity;
}

Map<String, dynamic> $UserInfoEntityToJson(UserInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['employeeAccount'] = entity.employeeAccount?.toJson();
  data['employeeBase'] = entity.employeeBase?.toJson();
  data['employeeOrg'] = entity.employeeOrg?.toJson();
  return data;
}

extension UserInfoEntityExtension on UserInfoEntity {
  UserInfoEntity copyWith({
    UserInfoEmployeeAccount? employeeAccount,
    UserInfoEmployeeBase? employeeBase,
    UserInfoEmployeeOrg? employeeOrg,
  }) {
    return UserInfoEntity()
      ..employeeAccount = employeeAccount ?? this.employeeAccount
      ..employeeBase = employeeBase ?? this.employeeBase
      ..employeeOrg = employeeOrg ?? this.employeeOrg;
  }
}

UserInfoEmployeeAccount $UserInfoEmployeeAccountFromJson(
    Map<String, dynamic> json) {
  final UserInfoEmployeeAccount userInfoEmployeeAccount = UserInfoEmployeeAccount();
  final bool? hasPassword = jsonConvert.convert<bool>(json['hasPassword']);
  if (hasPassword != null) {
    userInfoEmployeeAccount.hasPassword = hasPassword;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    userInfoEmployeeAccount.id = id;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    userInfoEmployeeAccount.status = status;
  }
  final UserInfoEmployeeAccountStatusPackage? statusPackage = jsonConvert
      .convert<UserInfoEmployeeAccountStatusPackage>(json['statusPackage']);
  if (statusPackage != null) {
    userInfoEmployeeAccount.statusPackage = statusPackage;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    userInfoEmployeeAccount.username = username;
  }
  return userInfoEmployeeAccount;
}

Map<String, dynamic> $UserInfoEmployeeAccountToJson(
    UserInfoEmployeeAccount entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['hasPassword'] = entity.hasPassword;
  data['id'] = entity.id;
  data['status'] = entity.status;
  data['statusPackage'] = entity.statusPackage?.toJson();
  data['username'] = entity.username;
  return data;
}

extension UserInfoEmployeeAccountExtension on UserInfoEmployeeAccount {
  UserInfoEmployeeAccount copyWith({
    bool? hasPassword,
    String? id,
    int? status,
    UserInfoEmployeeAccountStatusPackage? statusPackage,
    String? username,
  }) {
    return UserInfoEmployeeAccount()
      ..hasPassword = hasPassword ?? this.hasPassword
      ..id = id ?? this.id
      ..status = status ?? this.status
      ..statusPackage = statusPackage ?? this.statusPackage
      ..username = username ?? this.username;
  }
}

UserInfoEmployeeAccountStatusPackage $UserInfoEmployeeAccountStatusPackageFromJson(
    Map<String, dynamic> json) {
  final UserInfoEmployeeAccountStatusPackage userInfoEmployeeAccountStatusPackage = UserInfoEmployeeAccountStatusPackage();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    userInfoEmployeeAccountStatusPackage.code = code;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    userInfoEmployeeAccountStatusPackage.desc = desc;
  }
  return userInfoEmployeeAccountStatusPackage;
}

Map<String, dynamic> $UserInfoEmployeeAccountStatusPackageToJson(
    UserInfoEmployeeAccountStatusPackage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['desc'] = entity.desc;
  return data;
}

extension UserInfoEmployeeAccountStatusPackageExtension on UserInfoEmployeeAccountStatusPackage {
  UserInfoEmployeeAccountStatusPackage copyWith({
    int? code,
    String? desc,
  }) {
    return UserInfoEmployeeAccountStatusPackage()
      ..code = code ?? this.code
      ..desc = desc ?? this.desc;
  }
}

UserInfoEmployeeBase $UserInfoEmployeeBaseFromJson(Map<String, dynamic> json) {
  final UserInfoEmployeeBase userInfoEmployeeBase = UserInfoEmployeeBase();
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    userInfoEmployeeBase.birthday = birthday;
  }
  final int? eduLevel = jsonConvert.convert<int>(json['eduLevel']);
  if (eduLevel != null) {
    userInfoEmployeeBase.eduLevel = eduLevel;
  }
  final UserInfoEmployeeBaseEduLevelPackage? eduLevelPackage = jsonConvert
      .convert<UserInfoEmployeeBaseEduLevelPackage>(json['eduLevelPackage']);
  if (eduLevelPackage != null) {
    userInfoEmployeeBase.eduLevelPackage = eduLevelPackage;
  }
  final String? emergencyContact = jsonConvert.convert<String>(
      json['emergencyContact']);
  if (emergencyContact != null) {
    userInfoEmployeeBase.emergencyContact = emergencyContact;
  }
  final String? emergencyPhone = jsonConvert.convert<String>(
      json['emergencyPhone']);
  if (emergencyPhone != null) {
    userInfoEmployeeBase.emergencyPhone = emergencyPhone;
  }
  final int? gender = jsonConvert.convert<int>(json['gender']);
  if (gender != null) {
    userInfoEmployeeBase.gender = gender;
  }
  final UserInfoEmployeeBaseGenderPackage? genderPackage = jsonConvert.convert<
      UserInfoEmployeeBaseGenderPackage>(json['genderPackage']);
  if (genderPackage != null) {
    userInfoEmployeeBase.genderPackage = genderPackage;
  }
  final String? homeAddress = jsonConvert.convert<String>(json['homeAddress']);
  if (homeAddress != null) {
    userInfoEmployeeBase.homeAddress = homeAddress;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    userInfoEmployeeBase.id = id;
  }
  final String? idCard = jsonConvert.convert<String>(json['idCard']);
  if (idCard != null) {
    userInfoEmployeeBase.idCard = idCard;
  }
  final String? idCardBack = jsonConvert.convert<String>(json['idCardBack']);
  if (idCardBack != null) {
    userInfoEmployeeBase.idCardBack = idCardBack;
  }
  final String? idCardFront = jsonConvert.convert<String>(json['idCardFront']);
  if (idCardFront != null) {
    userInfoEmployeeBase.idCardFront = idCardFront;
  }
  final int? jobStatus = jsonConvert.convert<int>(json['jobStatus']);
  if (jobStatus != null) {
    userInfoEmployeeBase.jobStatus = jobStatus;
  }
  final int? maritalStatus = jsonConvert.convert<int>(json['maritalStatus']);
  if (maritalStatus != null) {
    userInfoEmployeeBase.maritalStatus = maritalStatus;
  }
  final UserInfoEmployeeBaseMaritalStatusPackage? maritalStatusPackage = jsonConvert
      .convert<UserInfoEmployeeBaseMaritalStatusPackage>(
      json['maritalStatusPackage']);
  if (maritalStatusPackage != null) {
    userInfoEmployeeBase.maritalStatusPackage = maritalStatusPackage;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userInfoEmployeeBase.name = name;
  }
  final String? nation = jsonConvert.convert<String>(json['nation']);
  if (nation != null) {
    userInfoEmployeeBase.nation = nation;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    userInfoEmployeeBase.phone = phone;
  }
  final String? photo = jsonConvert.convert<String>(json['photo']);
  if (photo != null) {
    userInfoEmployeeBase.photo = photo;
  }
  final int? politicalOutlook = jsonConvert.convert<int>(
      json['politicalOutlook']);
  if (politicalOutlook != null) {
    userInfoEmployeeBase.politicalOutlook = politicalOutlook;
  }
  final UserInfoEmployeeBasePoliticalOutlookPackage? politicalOutlookPackage = jsonConvert
      .convert<UserInfoEmployeeBasePoliticalOutlookPackage>(
      json['politicalOutlookPackage']);
  if (politicalOutlookPackage != null) {
    userInfoEmployeeBase.politicalOutlookPackage = politicalOutlookPackage;
  }
  final String? profile = jsonConvert.convert<String>(json['profile']);
  if (profile != null) {
    userInfoEmployeeBase.profile = profile;
  }
  return userInfoEmployeeBase;
}

Map<String, dynamic> $UserInfoEmployeeBaseToJson(UserInfoEmployeeBase entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
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
  data['maritalStatus'] = entity.maritalStatus;
  data['maritalStatusPackage'] = entity.maritalStatusPackage?.toJson();
  data['name'] = entity.name;
  data['nation'] = entity.nation;
  data['phone'] = entity.phone;
  data['photo'] = entity.photo;
  data['politicalOutlook'] = entity.politicalOutlook;
  data['politicalOutlookPackage'] = entity.politicalOutlookPackage?.toJson();
  data['profile'] = entity.profile;
  return data;
}

extension UserInfoEmployeeBaseExtension on UserInfoEmployeeBase {
  UserInfoEmployeeBase copyWith({
    String? birthday,
    int? eduLevel,
    UserInfoEmployeeBaseEduLevelPackage? eduLevelPackage,
    String? emergencyContact,
    String? emergencyPhone,
    int? gender,
    UserInfoEmployeeBaseGenderPackage? genderPackage,
    String? homeAddress,
    String? id,
    String? idCard,
    String? idCardBack,
    String? idCardFront,
    int? jobStatus,
    int? maritalStatus,
    UserInfoEmployeeBaseMaritalStatusPackage? maritalStatusPackage,
    String? name,
    String? nation,
    String? phone,
    String? photo,
    int? politicalOutlook,
    UserInfoEmployeeBasePoliticalOutlookPackage? politicalOutlookPackage,
    String? profile,
  }) {
    return UserInfoEmployeeBase()
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
      ..maritalStatus = maritalStatus ?? this.maritalStatus
      ..maritalStatusPackage = maritalStatusPackage ?? this.maritalStatusPackage
      ..name = name ?? this.name
      ..nation = nation ?? this.nation
      ..phone = phone ?? this.phone
      ..photo = photo ?? this.photo
      ..politicalOutlook = politicalOutlook ?? this.politicalOutlook
      ..politicalOutlookPackage = politicalOutlookPackage ??
          this.politicalOutlookPackage
      ..profile = profile ?? this.profile;
  }
}

UserInfoEmployeeBaseEduLevelPackage $UserInfoEmployeeBaseEduLevelPackageFromJson(
    Map<String, dynamic> json) {
  final UserInfoEmployeeBaseEduLevelPackage userInfoEmployeeBaseEduLevelPackage = UserInfoEmployeeBaseEduLevelPackage();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    userInfoEmployeeBaseEduLevelPackage.code = code;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    userInfoEmployeeBaseEduLevelPackage.desc = desc;
  }
  return userInfoEmployeeBaseEduLevelPackage;
}

Map<String, dynamic> $UserInfoEmployeeBaseEduLevelPackageToJson(
    UserInfoEmployeeBaseEduLevelPackage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['desc'] = entity.desc;
  return data;
}

extension UserInfoEmployeeBaseEduLevelPackageExtension on UserInfoEmployeeBaseEduLevelPackage {
  UserInfoEmployeeBaseEduLevelPackage copyWith({
    int? code,
    String? desc,
  }) {
    return UserInfoEmployeeBaseEduLevelPackage()
      ..code = code ?? this.code
      ..desc = desc ?? this.desc;
  }
}

UserInfoEmployeeBaseGenderPackage $UserInfoEmployeeBaseGenderPackageFromJson(
    Map<String, dynamic> json) {
  final UserInfoEmployeeBaseGenderPackage userInfoEmployeeBaseGenderPackage = UserInfoEmployeeBaseGenderPackage();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    userInfoEmployeeBaseGenderPackage.code = code;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    userInfoEmployeeBaseGenderPackage.desc = desc;
  }
  return userInfoEmployeeBaseGenderPackage;
}

Map<String, dynamic> $UserInfoEmployeeBaseGenderPackageToJson(
    UserInfoEmployeeBaseGenderPackage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['desc'] = entity.desc;
  return data;
}

extension UserInfoEmployeeBaseGenderPackageExtension on UserInfoEmployeeBaseGenderPackage {
  UserInfoEmployeeBaseGenderPackage copyWith({
    int? code,
    String? desc,
  }) {
    return UserInfoEmployeeBaseGenderPackage()
      ..code = code ?? this.code
      ..desc = desc ?? this.desc;
  }
}

UserInfoEmployeeBaseMaritalStatusPackage $UserInfoEmployeeBaseMaritalStatusPackageFromJson(
    Map<String, dynamic> json) {
  final UserInfoEmployeeBaseMaritalStatusPackage userInfoEmployeeBaseMaritalStatusPackage = UserInfoEmployeeBaseMaritalStatusPackage();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    userInfoEmployeeBaseMaritalStatusPackage.code = code;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    userInfoEmployeeBaseMaritalStatusPackage.desc = desc;
  }
  return userInfoEmployeeBaseMaritalStatusPackage;
}

Map<String, dynamic> $UserInfoEmployeeBaseMaritalStatusPackageToJson(
    UserInfoEmployeeBaseMaritalStatusPackage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['desc'] = entity.desc;
  return data;
}

extension UserInfoEmployeeBaseMaritalStatusPackageExtension on UserInfoEmployeeBaseMaritalStatusPackage {
  UserInfoEmployeeBaseMaritalStatusPackage copyWith({
    int? code,
    String? desc,
  }) {
    return UserInfoEmployeeBaseMaritalStatusPackage()
      ..code = code ?? this.code
      ..desc = desc ?? this.desc;
  }
}

UserInfoEmployeeBasePoliticalOutlookPackage $UserInfoEmployeeBasePoliticalOutlookPackageFromJson(
    Map<String, dynamic> json) {
  final UserInfoEmployeeBasePoliticalOutlookPackage userInfoEmployeeBasePoliticalOutlookPackage = UserInfoEmployeeBasePoliticalOutlookPackage();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    userInfoEmployeeBasePoliticalOutlookPackage.code = code;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    userInfoEmployeeBasePoliticalOutlookPackage.desc = desc;
  }
  return userInfoEmployeeBasePoliticalOutlookPackage;
}

Map<String, dynamic> $UserInfoEmployeeBasePoliticalOutlookPackageToJson(
    UserInfoEmployeeBasePoliticalOutlookPackage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['desc'] = entity.desc;
  return data;
}

extension UserInfoEmployeeBasePoliticalOutlookPackageExtension on UserInfoEmployeeBasePoliticalOutlookPackage {
  UserInfoEmployeeBasePoliticalOutlookPackage copyWith({
    int? code,
    String? desc,
  }) {
    return UserInfoEmployeeBasePoliticalOutlookPackage()
      ..code = code ?? this.code
      ..desc = desc ?? this.desc;
  }
}

UserInfoEmployeeOrg $UserInfoEmployeeOrgFromJson(Map<String, dynamic> json) {
  final UserInfoEmployeeOrg userInfoEmployeeOrg = UserInfoEmployeeOrg();
  final UserInfoEmployeeOrgMainOrg? mainOrg = jsonConvert.convert<
      UserInfoEmployeeOrgMainOrg>(json['mainOrg']);
  if (mainOrg != null) {
    userInfoEmployeeOrg.mainOrg = mainOrg;
  }
  final String? mainOrgId = jsonConvert.convert<String>(json['mainOrgId']);
  if (mainOrgId != null) {
    userInfoEmployeeOrg.mainOrgId = mainOrgId;
  }
  final List<String>? orgIdList = (json['orgIdList'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (orgIdList != null) {
    userInfoEmployeeOrg.orgIdList = orgIdList;
  }
  final List<UserInfoEmployeeOrgOrgList>? orgList = (json['orgList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<UserInfoEmployeeOrgOrgList>(
          e) as UserInfoEmployeeOrgOrgList).toList();
  if (orgList != null) {
    userInfoEmployeeOrg.orgList = orgList;
  }
  return userInfoEmployeeOrg;
}

Map<String, dynamic> $UserInfoEmployeeOrgToJson(UserInfoEmployeeOrg entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['mainOrg'] = entity.mainOrg?.toJson();
  data['mainOrgId'] = entity.mainOrgId;
  data['orgIdList'] = entity.orgIdList;
  data['orgList'] = entity.orgList?.map((v) => v.toJson()).toList();
  return data;
}

extension UserInfoEmployeeOrgExtension on UserInfoEmployeeOrg {
  UserInfoEmployeeOrg copyWith({
    UserInfoEmployeeOrgMainOrg? mainOrg,
    String? mainOrgId,
    List<String>? orgIdList,
    List<UserInfoEmployeeOrgOrgList>? orgList,
  }) {
    return UserInfoEmployeeOrg()
      ..mainOrg = mainOrg ?? this.mainOrg
      ..mainOrgId = mainOrgId ?? this.mainOrgId
      ..orgIdList = orgIdList ?? this.orgIdList
      ..orgList = orgList ?? this.orgList;
  }
}

UserInfoEmployeeOrgMainOrg $UserInfoEmployeeOrgMainOrgFromJson(
    Map<String, dynamic> json) {
  final UserInfoEmployeeOrgMainOrg userInfoEmployeeOrgMainOrg = UserInfoEmployeeOrgMainOrg();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    userInfoEmployeeOrgMainOrg.id = id;
  }
  final int? identityType = jsonConvert.convert<int>(json['identityType']);
  if (identityType != null) {
    userInfoEmployeeOrgMainOrg.identityType = identityType;
  }
  final UserInfoEmployeeOrgMainOrgIdentityTypePackage? identityTypePackage = jsonConvert
      .convert<UserInfoEmployeeOrgMainOrgIdentityTypePackage>(
      json['identityTypePackage']);
  if (identityTypePackage != null) {
    userInfoEmployeeOrgMainOrg.identityTypePackage = identityTypePackage;
  }
  final int? mainFlag = jsonConvert.convert<int>(json['mainFlag']);
  if (mainFlag != null) {
    userInfoEmployeeOrgMainOrg.mainFlag = mainFlag;
  }
  final UserInfoEmployeeOrgMainOrgOrg? org = jsonConvert.convert<
      UserInfoEmployeeOrgMainOrgOrg>(json['org']);
  if (org != null) {
    userInfoEmployeeOrgMainOrg.org = org;
  }
  return userInfoEmployeeOrgMainOrg;
}

Map<String, dynamic> $UserInfoEmployeeOrgMainOrgToJson(
    UserInfoEmployeeOrgMainOrg entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['identityType'] = entity.identityType;
  data['identityTypePackage'] = entity.identityTypePackage?.toJson();
  data['mainFlag'] = entity.mainFlag;
  data['org'] = entity.org?.toJson();
  return data;
}

extension UserInfoEmployeeOrgMainOrgExtension on UserInfoEmployeeOrgMainOrg {
  UserInfoEmployeeOrgMainOrg copyWith({
    String? id,
    int? identityType,
    UserInfoEmployeeOrgMainOrgIdentityTypePackage? identityTypePackage,
    int? mainFlag,
    UserInfoEmployeeOrgMainOrgOrg? org,
  }) {
    return UserInfoEmployeeOrgMainOrg()
      ..id = id ?? this.id
      ..identityType = identityType ?? this.identityType
      ..identityTypePackage = identityTypePackage ?? this.identityTypePackage
      ..mainFlag = mainFlag ?? this.mainFlag
      ..org = org ?? this.org;
  }
}

UserInfoEmployeeOrgMainOrgIdentityTypePackage $UserInfoEmployeeOrgMainOrgIdentityTypePackageFromJson(
    Map<String, dynamic> json) {
  final UserInfoEmployeeOrgMainOrgIdentityTypePackage userInfoEmployeeOrgMainOrgIdentityTypePackage = UserInfoEmployeeOrgMainOrgIdentityTypePackage();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    userInfoEmployeeOrgMainOrgIdentityTypePackage.code = code;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    userInfoEmployeeOrgMainOrgIdentityTypePackage.desc = desc;
  }
  return userInfoEmployeeOrgMainOrgIdentityTypePackage;
}

Map<String, dynamic> $UserInfoEmployeeOrgMainOrgIdentityTypePackageToJson(
    UserInfoEmployeeOrgMainOrgIdentityTypePackage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['desc'] = entity.desc;
  return data;
}

extension UserInfoEmployeeOrgMainOrgIdentityTypePackageExtension on UserInfoEmployeeOrgMainOrgIdentityTypePackage {
  UserInfoEmployeeOrgMainOrgIdentityTypePackage copyWith({
    int? code,
    String? desc,
  }) {
    return UserInfoEmployeeOrgMainOrgIdentityTypePackage()
      ..code = code ?? this.code
      ..desc = desc ?? this.desc;
  }
}

UserInfoEmployeeOrgMainOrgOrg $UserInfoEmployeeOrgMainOrgOrgFromJson(
    Map<String, dynamic> json) {
  final UserInfoEmployeeOrgMainOrgOrg userInfoEmployeeOrgMainOrgOrg = UserInfoEmployeeOrgMainOrgOrg();
  final String? abbreviation = jsonConvert.convert<String>(
      json['abbreviation']);
  if (abbreviation != null) {
    userInfoEmployeeOrgMainOrgOrg.abbreviation = abbreviation;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    userInfoEmployeeOrgMainOrgOrg.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userInfoEmployeeOrgMainOrgOrg.name = name;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    userInfoEmployeeOrgMainOrgOrg.type = type;
  }
  return userInfoEmployeeOrgMainOrgOrg;
}

Map<String, dynamic> $UserInfoEmployeeOrgMainOrgOrgToJson(
    UserInfoEmployeeOrgMainOrgOrg entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['abbreviation'] = entity.abbreviation;
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['type'] = entity.type;
  return data;
}

extension UserInfoEmployeeOrgMainOrgOrgExtension on UserInfoEmployeeOrgMainOrgOrg {
  UserInfoEmployeeOrgMainOrgOrg copyWith({
    String? abbreviation,
    String? id,
    String? name,
    int? type,
  }) {
    return UserInfoEmployeeOrgMainOrgOrg()
      ..abbreviation = abbreviation ?? this.abbreviation
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..type = type ?? this.type;
  }
}

UserInfoEmployeeOrgOrgList $UserInfoEmployeeOrgOrgListFromJson(
    Map<String, dynamic> json) {
  final UserInfoEmployeeOrgOrgList userInfoEmployeeOrgOrgList = UserInfoEmployeeOrgOrgList();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    userInfoEmployeeOrgOrgList.id = id;
  }
  final int? identityType = jsonConvert.convert<int>(json['identityType']);
  if (identityType != null) {
    userInfoEmployeeOrgOrgList.identityType = identityType;
  }
  final UserInfoEmployeeOrgOrgListIdentityTypePackage? identityTypePackage = jsonConvert
      .convert<UserInfoEmployeeOrgOrgListIdentityTypePackage>(
      json['identityTypePackage']);
  if (identityTypePackage != null) {
    userInfoEmployeeOrgOrgList.identityTypePackage = identityTypePackage;
  }
  final int? mainFlag = jsonConvert.convert<int>(json['mainFlag']);
  if (mainFlag != null) {
    userInfoEmployeeOrgOrgList.mainFlag = mainFlag;
  }
  final UserInfoEmployeeOrgOrgListOrg? org = jsonConvert.convert<
      UserInfoEmployeeOrgOrgListOrg>(json['org']);
  if (org != null) {
    userInfoEmployeeOrgOrgList.org = org;
  }
  return userInfoEmployeeOrgOrgList;
}

Map<String, dynamic> $UserInfoEmployeeOrgOrgListToJson(
    UserInfoEmployeeOrgOrgList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['identityType'] = entity.identityType;
  data['identityTypePackage'] = entity.identityTypePackage?.toJson();
  data['mainFlag'] = entity.mainFlag;
  data['org'] = entity.org?.toJson();
  return data;
}

extension UserInfoEmployeeOrgOrgListExtension on UserInfoEmployeeOrgOrgList {
  UserInfoEmployeeOrgOrgList copyWith({
    String? id,
    int? identityType,
    UserInfoEmployeeOrgOrgListIdentityTypePackage? identityTypePackage,
    int? mainFlag,
    UserInfoEmployeeOrgOrgListOrg? org,
  }) {
    return UserInfoEmployeeOrgOrgList()
      ..id = id ?? this.id
      ..identityType = identityType ?? this.identityType
      ..identityTypePackage = identityTypePackage ?? this.identityTypePackage
      ..mainFlag = mainFlag ?? this.mainFlag
      ..org = org ?? this.org;
  }
}

UserInfoEmployeeOrgOrgListIdentityTypePackage $UserInfoEmployeeOrgOrgListIdentityTypePackageFromJson(
    Map<String, dynamic> json) {
  final UserInfoEmployeeOrgOrgListIdentityTypePackage userInfoEmployeeOrgOrgListIdentityTypePackage = UserInfoEmployeeOrgOrgListIdentityTypePackage();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    userInfoEmployeeOrgOrgListIdentityTypePackage.code = code;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    userInfoEmployeeOrgOrgListIdentityTypePackage.desc = desc;
  }
  return userInfoEmployeeOrgOrgListIdentityTypePackage;
}

Map<String, dynamic> $UserInfoEmployeeOrgOrgListIdentityTypePackageToJson(
    UserInfoEmployeeOrgOrgListIdentityTypePackage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['desc'] = entity.desc;
  return data;
}

extension UserInfoEmployeeOrgOrgListIdentityTypePackageExtension on UserInfoEmployeeOrgOrgListIdentityTypePackage {
  UserInfoEmployeeOrgOrgListIdentityTypePackage copyWith({
    int? code,
    String? desc,
  }) {
    return UserInfoEmployeeOrgOrgListIdentityTypePackage()
      ..code = code ?? this.code
      ..desc = desc ?? this.desc;
  }
}

UserInfoEmployeeOrgOrgListOrg $UserInfoEmployeeOrgOrgListOrgFromJson(
    Map<String, dynamic> json) {
  final UserInfoEmployeeOrgOrgListOrg userInfoEmployeeOrgOrgListOrg = UserInfoEmployeeOrgOrgListOrg();
  final String? abbreviation = jsonConvert.convert<String>(
      json['abbreviation']);
  if (abbreviation != null) {
    userInfoEmployeeOrgOrgListOrg.abbreviation = abbreviation;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    userInfoEmployeeOrgOrgListOrg.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userInfoEmployeeOrgOrgListOrg.name = name;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    userInfoEmployeeOrgOrgListOrg.type = type;
  }
  return userInfoEmployeeOrgOrgListOrg;
}

Map<String, dynamic> $UserInfoEmployeeOrgOrgListOrgToJson(
    UserInfoEmployeeOrgOrgListOrg entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['abbreviation'] = entity.abbreviation;
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['type'] = entity.type;
  return data;
}

extension UserInfoEmployeeOrgOrgListOrgExtension on UserInfoEmployeeOrgOrgListOrg {
  UserInfoEmployeeOrgOrgListOrg copyWith({
    String? abbreviation,
    String? id,
    String? name,
    int? type,
  }) {
    return UserInfoEmployeeOrgOrgListOrg()
      ..abbreviation = abbreviation ?? this.abbreviation
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..type = type ?? this.type;
  }
}