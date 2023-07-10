import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/di/di_container.dart';
import 'package:one_trade/domain/order_domain.dart';
import 'package:one_trade/interactors/order/order_interactor.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_deals_view/closed/portfolio_detail_deals_closed_model.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_deals_view/closed/portfolio_detail_deals_closed_view.dart';
import 'package:one_trade/utils/inject.dart';

abstract class IPortfolioDetailDealsViewClosedWidgetModel extends IWidgetModel {
  ListenableState<EntityState<List<OrderDomain>>> get closedOrderList;
}

PortfolioDetailDealsViewClosedWidgetModel
    defaultPortfolioDetailDealsViewClosedWidgetModelFactory(
  BuildContext context, {
  required int login,
}) {
  return PortfolioDetailDealsViewClosedWidgetModel(
      PortfolioDetailDealsViewClosedModel(
    standardErrorHandler,
    inject<OrderInteractor>(),
    login: login,
  ));
}

/// Elementary widget model для страницы информации закрытых сделок пользователя
class PortfolioDetailDealsViewClosedWidgetModel extends WidgetModel<
        PortfolioDetailDealsViewClosed, PortfolioDetailDealsViewClosedModel>
    implements IPortfolioDetailDealsViewClosedWidgetModel {
  PortfolioDetailDealsViewClosedWidgetModel(
      PortfolioDetailDealsViewClosedModel model)
      : super(model);

  final _closedOrderList = EntityStateNotifier<List<OrderDomain>>();

  @override
  ListenableState<EntityState<List<OrderDomain>>> get closedOrderList =>
      _closedOrderList;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadIpoList();
  }

  /// Получение завершенных заказов ipo пользователя
  Future<void> _loadIpoList() async {
    final previousData = _closedOrderList.value?.data;
    _closedOrderList.loading(previousData);

    try {
      final res = await model.getClosedOrders(
        login: model.login,
      );
      _closedOrderList.content(res ?? []);
    } on Exception catch (e) {
      _closedOrderList.error(e, previousData);
    }
  }
}
