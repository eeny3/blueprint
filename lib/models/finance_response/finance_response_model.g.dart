// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinanceResponseModel _$FinanceResponseModelFromJson(
        Map<String, dynamic> json) =>
    FinanceResponseModel(
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      id: json['id'] as int?,
      system: json['system'] as int?,
      amount: json['amount'] as String?,
      state: json['state'] as int?,
      type: json['type'] as int?,
      login: json['login'] as int?,
      adminComment: json['adminComment'] as String?,
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$FinanceResponseModelToJson(
        FinanceResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'type': instance.type,
      'system': instance.system,
      'amount': instance.amount,
      'state': instance.state,
      'adminComment': instance.adminComment,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
    };
