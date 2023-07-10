import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/di/di_container.dart';
import 'package:one_trade/domain/order_domain.dart';
import 'package:one_trade/interactors/order/order_interactor.dart';
import 'package:one_trade/models/order/order_response_model.dart';
import 'package:one_trade/service/networking/account_api/account_api.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_deals_view/opened/portfolio_detail_deals_opened_model.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_deals_view/opened/portfolio_detail_deals_opened_view.dart';
import 'package:one_trade/utils/inject.dart';

abstract class IPortfolioDetailDealsViewOpenedWidgetModel extends IWidgetModel {
  ListenableState<EntityState<List<OrderDomain>>> get openedOrderList;
}

PortfolioDetailDealsViewOpenedWidgetModel
    defaultPortfolioDetailDealsViewOpenedWidgetModelFactory(
  BuildContext context, {
  required int login,
}) {
  return PortfolioDetailDealsViewOpenedWidgetModel(
      PortfolioDetailDealsViewOpenedModel(
    standardErrorHandler,
        inject<OrderInteractor>(),
    login: login,
  ));
}

/// Elementary widget model для страницы информации открытых сделок пользователя
class PortfolioDetailDealsViewOpenedWidgetModel extends WidgetModel<
        PortfolioDetailDealsViewOpened, PortfolioDetailDealsViewOpenedModel>
    implements IPortfolioDetailDealsViewOpenedWidgetModel {
  PortfolioDetailDealsViewOpenedWidgetModel(
      PortfolioDetailDealsViewOpenedModel model)
      : super(model);

  final _openedOrderList = EntityStateNotifier<List<OrderDomain>>();

  @override
  ListenableState<EntityState<List<OrderDomain>>> get openedOrderList =>
      _openedOrderList;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadIpoList();
  }

  /// Получение открытых заказов ipo пользователя
  Future<void> _loadIpoList() async {
    final previousData = _openedOrderList.value?.data;
    _openedOrderList.loading(previousData);

    try {
      final res =
          await model.getOpenedOrders(login: model.login);
      _openedOrderList.content(res ?? []);
    } on Exception catch (e) {
      _openedOrderList.error(e, previousData);
    }
  }
}
