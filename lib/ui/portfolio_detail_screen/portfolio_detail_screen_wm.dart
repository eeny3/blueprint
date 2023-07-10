import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/domain/account_domain.dart';
import 'package:one_trade/ui/exchange/exchane_screen.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_screen.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_screen_model.dart';
import 'package:one_trade/ui/withdraw/withdraw_type_select_view.dart';
import 'package:one_trade/utils/inject.dart';

abstract class IPortfolioDetailScreenWidgetModel extends IWidgetModel {

  /// Навигация назад
  void pop();

  /// Показать нижнего всплывающего экрана выбора вывода средств
  void showWithdrawTypeSelectBottomSheet();

  /// Навигация вывод средств
  void navigateExchangeScreen();
}

PortfolioDetailScreenWidgetModel defaultPortfolioDetailScreenWidgetModelFactory(
  BuildContext context,
  AccountDomain accountDomain,
) {
  return PortfolioDetailScreenWidgetModel(PortfolioDetailScreenModel(
    standardErrorHandler,
    accountDomain,
  ));
}

/// Elementary widget model для страницы информации счета пользователя
class PortfolioDetailScreenWidgetModel
    extends WidgetModel<PortfolioDetailScreen, PortfolioDetailScreenModel>
    implements IPortfolioDetailScreenWidgetModel {
  PortfolioDetailScreenWidgetModel(PortfolioDetailScreenModel model)
      : super(model);

  /// Навигация назад
  @override
  void pop() => Navigator.of(context).pop();

  /// Показать нижнего всплывающего экрана выбора вывода средств
  @override
  Future showWithdrawTypeSelectBottomSheet() {
    return showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => WithdrawTypeSelectView(),
    );
  }

  /// Навигация вывод средств
  @override
  void navigateExchangeScreen() => Navigator.push(
        context,
        ExchangeScreenRoute(),
      );
}
