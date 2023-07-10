import 'package:one_trade/domain/account_domain.dart';
import 'package:one_trade/models/account/account_response_model.dart';

AccountDomain mapToAccount(AccountResponseModel model) => AccountDomain(
  floatingBalance: model.floatingBalance,
  withdrawalAllowed: model.withdrawalAllowed,
  invested: model.invested,
  login: model.login,
  type: model.type,
  created: model.created,
  name: model.customName ?? model.name,
  leverage: model.leverage,
  balance: model.balance,
  credit: model.credit,
  equity: model.equity,
  closedProfit: model.closedProfit,
  inBalance: model.inBalance,
  outBalance: model.outBalance,
  countOpenOrders: model.countOpenOrders,
  profitabilityPercent: model.profitabilityPercent,
  pammMaster: model.pammMaster,
  partner: model.partner,
  yieldPercent: model.yieldPercent,
  profitForWithdrawal: model.profitForWithdrawal,
);