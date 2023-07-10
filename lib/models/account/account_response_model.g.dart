// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountResponseModel _$AccountResponseModelFromJson(
        Map<String, dynamic> json) =>
    AccountResponseModel(
      floatingBalance: json['floatingBalance'] as num?,
      withdrawalAllowed: json['withdrawalAllowed'] as bool?,
      invested: json['invested'] as bool?,
      customName: json['customName'] as String?,
      login: json['login'] as int?,
      type: json['type'] as String?,
      created: json['created'] as String?,
      name: json['name'] as String?,
      leverage: json['leverage'] as int?,
      balance: json['balance'] as num?,
      credit: json['credit'],
      equity: json['equity'] as num?,
      closedProfit: json['closedProfit'] as num?,
      inBalance: json['inBalance'] as num?,
      outBalance: json['outBalance'] as num?,
      countOpenOrders: json['countOpenOrders'] as int?,
      profitabilityPercent: json['profitabilityPercent'] as num?,
      pammMaster: json['pammMaster'],
      partner: json['partner'] as bool?,
      yieldPercent: json['yieldPercent'] as num?,
      profitForWithdrawal: json['profitForWithdrawal'],
    );

Map<String, dynamic> _$AccountResponseModelToJson(
        AccountResponseModel instance) =>
    <String, dynamic>{
      'floatingBalance': instance.floatingBalance,
      'withdrawalAllowed': instance.withdrawalAllowed,
      'invested': instance.invested,
      'customName': instance.customName,
      'login': instance.login,
      'type': instance.type,
      'created': instance.created,
      'name': instance.name,
      'leverage': instance.leverage,
      'balance': instance.balance,
      'credit': instance.credit,
      'equity': instance.equity,
      'closedProfit': instance.closedProfit,
      'inBalance': instance.inBalance,
      'outBalance': instance.outBalance,
      'countOpenOrders': instance.countOpenOrders,
      'profitabilityPercent': instance.profitabilityPercent,
      'pammMaster': instance.pammMaster,
      'partner': instance.partner,
      'yieldPercent': instance.yieldPercent,
      'profitForWithdrawal': instance.profitForWithdrawal,
    };
