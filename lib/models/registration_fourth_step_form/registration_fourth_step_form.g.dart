// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_fourth_step_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationFourthStepFormModel _$RegistrationFourthStepFormModelFromJson(
        Map<String, dynamic> json) =>
    RegistrationFourthStepFormModel(
      phone: json['phone'] as String,
      jurisdiction: json['jurisdiction'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      dob: json['dob'] as String,
      address: json['address'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$RegistrationFourthStepFormModelToJson(
        RegistrationFourthStepFormModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'jurisdiction': instance.jurisdiction,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'dob': instance.dob,
      'address': instance.address,
      'email': instance.email,
    };
