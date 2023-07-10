import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/domain/basket_domain.dart';
import 'package:one_trade/ui/basket/basket_request_success_screen.dart';
import 'package:one_trade/ui/basket/basket_screen.dart';
import 'package:one_trade/ui/basket/basket_screen_model.dart';
import 'package:one_trade/ui/basket/exchange_trading_view/exchange_trading_view.dart';
import 'package:one_trade/ui/basket/exchange_trading_view/exchange_trading_view_model.dart';
import 'package:one_trade/ui/choose_account/choose_account_screen.dart';
import 'package:one_trade/utils/inject.dart';

abstract class IBasketScreenWidgetModel extends IWidgetModel {
  ListenableState<EntityState<List<BasketDomain>>> get basketList;

  /// Выбор аккаунта для оплаты
  Future<void> chooseAccount();

  /// Навигация назад
  void goBack();
}

BasketScreenWidgetModel defaultAppWidgetModelFactory(BuildContext context) {
  return BasketScreenWidgetModel(BasketScreenModel(standardErrorHandler));
}

class BasketScreenWidgetModel
    extends WidgetModel<BasketScreen, BasketScreenModel>
    implements IBasketScreenWidgetModel {
  BasketScreenWidgetModel(BasketScreenModel model) : super(model);

  @override
  final basketList = EntityStateNotifier<List<BasketDomain>>();

  /// Выбор аккаунта для оплаты
  @override
  Future<void> chooseAccount() async {
    Navigator.push(
      context,
      ChooseAccountScreenRoute(),
    );
  }

  /// Навигация назад
  @override
  void goBack() => Navigator.of(context).pop();
}
