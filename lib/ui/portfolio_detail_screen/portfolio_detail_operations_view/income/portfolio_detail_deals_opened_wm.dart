import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_operations_view/income/portfolio_detail_operations_income_model.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_operations_view/income/portfolio_detail_operations_income_view.dart';
import 'package:one_trade/utils/inject.dart';

abstract class IAccountDetailsOperationsViewIncomeWidgetModel extends IWidgetModel {
}

AccountDetailsOperationsViewIncomeWidgetModel defaultAccountDetailsOperationsViewIncomeWidgetModelFactory(
    BuildContext context) {
  return AccountDetailsOperationsViewIncomeWidgetModel(
      AccountDetailsOperationsViewIncomeModel(standardErrorHandler));
}

/// Elementary widget model для страницы информации операции пополнений пользователя
class AccountDetailsOperationsViewIncomeWidgetModel
    extends WidgetModel<AccountDetailsOperationsViewIncome, AccountDetailsOperationsViewIncomeModel>
    implements IAccountDetailsOperationsViewIncomeWidgetModel {
  AccountDetailsOperationsViewIncomeWidgetModel(
      AccountDetailsOperationsViewIncomeModel model) : super(model);
}
