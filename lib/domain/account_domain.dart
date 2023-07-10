import 'package:one_trade/resources/strings/common_strings.dart';

/// Доменная модель счета пользователя
class AccountDomain {
  num? floatingBalance;
  bool withdrawalAllowed;
  bool invested;
  String name;
  int? login;
  String type;
  String created;
  int? leverage;
  num? balance;
  Object? credit;
  num? equity;
  num? closedProfit;
  num? inBalance;
  num? outBalance;
  int? countOpenOrders;
  num? profitabilityPercent;
  Object? pammMaster;
  bool partner;
  num? yieldPercent;
  Object? profitForWithdrawal;

  AccountDomain({
    this.floatingBalance,
    this.login,
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
    this.yieldPercent,
    this.profitForWithdrawal,
    String? type,
    String? created,
    String? name,
    bool? partner,
    bool? invested,
    bool? withdrawalAllowed,
  })  : type = type ?? emptyString,
        created = created ?? emptyString,
        name = name ?? emptyString,
        partner = partner ?? false,
        invested = invested ?? false,
        withdrawalAllowed = withdrawalAllowed ?? false;

  String get balanceRounded => balance.toString().split('.')[0];

  String get balanceRemainder {
    List balanceSplitted = balance.toString().split('.');
    String remainder = balanceSplitted.length > 1 ? balanceSplitted[1] : '0';
    return remainder.length > 1 ? remainder.substring(0, 2) : remainder;
  }
}
