import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_operations_view/withdraw/portfolio_detail_deals_closed_model.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_operations_view/withdraw/portfolio_detail_deals_closed_view.dart';
import 'package:one_trade/utils/inject.dart';

abstract class IAccountDetailsOperationsViewWithdrawWidgetModel extends IWidgetModel {
}

AccountDetailsOperationsViewWithdrawWidgetModel defaultAccountDetailsOperationsViewWithdrawWidgetModelFactory(
    BuildContext context) {
  return AccountDetailsOperationsViewWithdrawWidgetModel(
      AccountDetailsOperationsViewWithdrawModel(standardErrorHandler));
}

/// Elementary widget model для страницы информации операции вывода пользователя
class AccountDetailsOperationsViewWithdrawWidgetModel
    extends WidgetModel<AccountDetailsOperationsViewWithdraw, AccountDetailsOperationsViewWithdrawModel>
    implements IAccountDetailsOperationsViewWithdrawWidgetModel {
  AccountDetailsOperationsViewWithdrawWidgetModel(AccountDetailsOperationsViewWithdrawModel model) : super(model);

}
