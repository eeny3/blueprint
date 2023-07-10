// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileResponseModelRoot _$UserProfileResponseModelRootFromJson(
        Map<String, dynamic> json) =>
    UserProfileResponseModelRoot(
      user: json['user'] == null
          ? null
          : UserProfileResponseModel.fromJson(
              json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileResponseModelRootToJson(
        UserProfileResponseModelRoot instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

UserProfileResponseModel _$UserProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserProfileResponseModel(
      lastName: json['lastName'] as String?,
      firstName: json['firstName'] as String?,
      secondName: json['secondName'] as String?,
      phone: json['phone'] as String?,
      dob: json['dob'] as String?,
      verified: json['verified'] as bool?,
    );

Map<String, dynamic> _$UserProfileResponseModelToJson(
        UserProfileResponseModel instance) =>
    <String, dynamic>{
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'secondName': instance.secondName,
      'dob': instance.dob,
      'phone': instance.phone,
      'verified': instance.verified,
    };

ContactSiteResponseModel _$ContactSiteResponseModelFromJson(
        Map<String, dynamic> json) =>
    ContactSiteResponseModel(
      email: json['EMAIL'] as String?,
      phone: json['PHONE'] as String?,
      telegram: json['TELEGRAM'] as String?,
    );

Map<String, dynamic> _$ContactSiteResponseModelToJson(
        ContactSiteResponseModel instance) =>
    <String, dynamic>{
      'EMAIL': instance.email,
      'PHONE': instance.phone,
      'TELEGRAM': instance.telegram,
    };
