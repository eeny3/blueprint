import 'package:flutter/material.dart';
import 'package:elementary/elementary.dart';

import 'package:one_trade/ui/exchange/exchange_invest_view/exchange_invest_view.dart';
import 'package:one_trade/ui/exchange/exchange_invest_view/exchange_invest_view_model.dart';

import 'package:one_trade/utils/inject.dart';

abstract class IExchangeInvestViewWidgetModel extends IWidgetModel {
  ListenableState<EntityState<bool>> get isTradeState;

  ListenableState<EntityState<List<dynamic>>> get accounts;

  /// Оплата инвестиционного счета
  submitExchangeInvest();
}

ExchangeInvestViewWidgetModel defaultAppWidgetModelFactory(
    BuildContext context) {
  return ExchangeInvestViewWidgetModel(
      ExchangeInvestViewModel(standardErrorHandler));
}

/// Elementary widget model для страницы перевода инвестиции
class ExchangeInvestViewWidgetModel
    extends WidgetModel<ExchangeInvestView, ExchangeInvestViewModel>
    implements IExchangeInvestViewWidgetModel {
  ExchangeInvestViewWidgetModel(ExchangeInvestViewModel model) : super(model);

  final _isTradeState = EntityStateNotifier<bool>();

  // todo remove initial data
  final _accounts = EntityStateNotifier<List<dynamic>>(EntityState(data: [1]));

  @override
  ListenableState<EntityState<bool>> get isTradeState => _isTradeState;

  @override
  ListenableState<EntityState<List>> get accounts => _accounts;

  /// Оплата инвестиционного счета
  @override
  submitExchangeInvest() {}
}
