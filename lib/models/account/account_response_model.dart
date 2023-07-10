import 'package:json_annotation/json_annotation.dart';
import 'package:one_trade/domain/account_domain.dart';

part 'account_response_model.g.dart';

/// Модель счета пользователя
@JsonSerializable()
class AccountResponseModel {
  num? floatingBalance;
  bool? withdrawalAllowed;
  bool? invested;
  String? customName;
  int? login;
  String? type;
  String? created;
  String? name;
  int? leverage;
  num? balance;
  dynamic credit;
  num? equity;
  num? closedProfit;
  num? inBalance;
  num? outBalance;
  int? countOpenOrders;
  num? profitabilityPercent;
  dynamic pammMaster;
  bool? partner;
  num? yieldPercent;
  dynamic profitForWithdrawal;

  AccountResponseModel({
    this.floatingBalance,
    this.withdrawalAllowed,
    this.invested,
    this.customName,
    this.login,
    this.type,
    this.created,
    this.name,
    this.leverage,
    this.balance,
    this.credit,
    this.equity,
    this.closedProfit,
    this.inBalance,
    this.outBalance,
    this.countOpenOrders,
    this.profitabilityPercent,
    this.pammMaster,
    this.partner,
    this.yieldPercent,
    this.profitForWithdrawal,
  });

  factory AccountResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AccountResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AccountResponseModelToJson(this);
  }
}
