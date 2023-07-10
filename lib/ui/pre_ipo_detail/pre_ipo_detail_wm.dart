import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/ui/choose_account/choose_account_screen.dart';
import 'package:one_trade/ui/pre_ipo_detail/pre_ipo_detail.dart';
import 'package:one_trade/ui/pre_ipo_detail/pre_ipo_detail_model.dart';
import 'package:one_trade/utils/inject.dart';

/// Абстракция Widget Model для Pre Ipo детальной страницы
abstract class IPreIpoDetailWidgetModel extends IWidgetModel {
  ListenableState<EntityState<int>> get count;

  /// Переход на выбор счета
  Future<void> chooseAccount();

  /// Навигация назад
  void goBack();

  /// Добавление ipo в корзину
  void addToCart();

  /// Изменение количества на +1 в корзине
  void plus();

  /// Изменение количества на -1 в корзине
  void minus();
}

PreIpoDetailWidgetModel defaultAppWidgetModelFactory(BuildContext context) {
  return PreIpoDetailWidgetModel(PreIpoDetailModel(standardErrorHandler));
}

/// Имплементация и реализация [IPreIpoDetailWidgetModel] Pre Ipo детальной страницы
class PreIpoDetailWidgetModel
    extends WidgetModel<PreIpoDetailScreen, PreIpoDetailModel>
    implements IPreIpoDetailWidgetModel {
  PreIpoDetailWidgetModel(PreIpoDetailModel model) : super(model);

  final _count = EntityStateNotifier<int>(EntityState(data: 1));

  /// Переход на выбор счета
  @override
  Future<void> chooseAccount() async {
    Navigator.push(context, ChooseAccountScreenRoute());
  }

  /// Навигация назад
  @override
  void goBack() => Navigator.of(context).pop();

  /// Добавление ipo в корзину
  @override
  void addToCart() {
    // TODO: implement addToCart
  }

  @override
  ListenableState<EntityState<int>> get count => _count;

  /// Изменение количества на -1 в корзине
  @override
  void minus() {
    final previousData = _count.value?.data ?? 1;

    if (previousData - 1 > 0) {
      _count.content(previousData - 1);
    } else {}
  }

  /// Изменение количества на +1 в корзине
  @override
  void plus() {
    final previousData = _count.value?.data ?? 1;

    _count.content(previousData + 1);
  }
}
