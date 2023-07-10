// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_accounts_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAccountsResponseModel _$UserAccountsResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserAccountsResponseModel(
      brokerList: (json['brokerList'] as List<dynamic>?)
          ?.map((e) => AccountResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      investList: (json['investList'] as List<dynamic>?)
          ?.map((e) => AccountResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      mt5List: (json['mt5List'] as List<dynamic>?)
          ?.map((e) => AccountResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserAccountsResponseModelToJson(
        UserAccountsResponseModel instance) =>
    <String, dynamic>{
      'brokerList': instance.brokerList,
      'investList': instance.investList,
      'mt5List': instance.mt5List,
    };
