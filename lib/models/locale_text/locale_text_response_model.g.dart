// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_text_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocaleTextResponseModel _$LocaleTextResponseModelFromJson(
        Map<String, dynamic> json) =>
    LocaleTextResponseModel(
      language: json['language'] as String?,
      shortDescription: json['shortDescription'] as String?,
      longDescription: json['longDescription'] as String?,
    );

Map<String, dynamic> _$LocaleTextResponseModelToJson(
        LocaleTextResponseModel instance) =>
    <String, dynamic>{
      'language': instance.language,
      'shortDescription': instance.shortDescription,
      'longDescription': instance.longDescription,
    };
