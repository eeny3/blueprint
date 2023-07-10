import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/domain/account_domain.dart';
import 'package:one_trade/ui/exchange/exchange_invest_view/widgets/sum_enter_view.dart';
import 'package:one_trade/ui/exchange/exchange_trading_view/exchange_trading_view.dart';
import 'package:one_trade/ui/exchange/exchange_trading_view/exchange_trading_view_model.dart';
import 'package:one_trade/utils/inject.dart';

abstract class IExchangeTradingViewWidgetModel extends IWidgetModel {
  ListenableState<EntityState<bool>> get isTradeState;

  ListenableState<EntityState<List<AccountDomain>>> get accounts;

  /// Вывод всплывающего страницы ввода суммы
  Future<void> showPaymentSumView();
}

ExchangeTradingViewWidgetModel defaultAppWidgetModelFactory(
    BuildContext context) {
  return ExchangeTradingViewWidgetModel(
      ExchangeTradingViewModel(standardErrorHandler));
}

/// Elementary widget model для страницы перевода торговли
class ExchangeTradingViewWidgetModel
    extends WidgetModel<ExchangeTradingView, ExchangeTradingViewModel>
    implements IExchangeTradingViewWidgetModel {
  ExchangeTradingViewWidgetModel(ExchangeTradingViewModel model) : super(model);

  @override
  final isTradeState = EntityStateNotifier<bool>();

  @override
  final accounts = EntityStateNotifier<List<AccountDomain>>();

  /// Вывод всплывающего страницы ввода суммы
  @override
  Future<void> showPaymentSumView() async {
    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => SumEnterView(),
    );
  }
}
