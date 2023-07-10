import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/ui/basket/basket_request_success_screen.dart';
import 'package:one_trade/ui/basket/exchange_trading_view/exchange_trading_view.dart';
import 'package:one_trade/ui/basket/exchange_trading_view/exchange_trading_view_model.dart';
import 'package:one_trade/utils/inject.dart';

abstract class IExchangeTradingViewWidgetModel extends IWidgetModel {
  ListenableState<EntityState<bool>> get isTradeState;

  ListenableState<EntityState<List<dynamic>>> get accounts;

  /// Подтверждение оплаты
  Future<void> submitPayment();
}

ExchangeTradingViewWidgetModel defaultAppWidgetModelFactory(
    BuildContext context) {
  return ExchangeTradingViewWidgetModel(
      ExchangeTradingViewModel(standardErrorHandler));
}

/// Elementary widget model для страницы вывода средств
class ExchangeTradingViewWidgetModel
    extends WidgetModel<ExchangeTradingView, ExchangeTradingViewModel>
    implements IExchangeTradingViewWidgetModel {
  ExchangeTradingViewWidgetModel(ExchangeTradingViewModel model) : super(model);

  final _isTradeState = EntityStateNotifier<bool>();

  // todo remove initial data
  final _accounts = EntityStateNotifier<List<dynamic>>(EntityState(data: [1]));

  @override
  ListenableState<EntityState<bool>> get isTradeState => _isTradeState;

  @override
  ListenableState<EntityState<List>> get accounts => _accounts;

  /// Подтверждение оплаты
  @override
  Future<void> submitPayment() async {
    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => BasketRequestSuccessScreen(),
    );
  }
}
