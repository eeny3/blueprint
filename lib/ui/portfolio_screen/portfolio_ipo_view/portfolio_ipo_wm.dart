import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/di/di_container.dart';
import 'package:one_trade/domain/stock_domain.dart';
import 'package:one_trade/interactors/stock/stock_interactor.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_ipo_view/portfolio_ipo_view.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_ipo_view/portfolio_ipo_view_model.dart';
import 'package:one_trade/utils/inject.dart';

abstract class IPortfolioIpoViewWidgetModel extends IWidgetModel {
  ListenableState<EntityState<List<StockDomain>>> get ipoListState;
}

PortfolioIpoViewWidgetModel defaultPortfolioIpoViewWidgetModelFactory(
    BuildContext context) {
  return PortfolioIpoViewWidgetModel(
    PortfolioIpoViewModel(
      standardErrorHandler,
      inject<StockInteractor>(),
    ),
  );
}

/// Elementary widget model для страницы ipo
class PortfolioIpoViewWidgetModel
    extends WidgetModel<PortfolioIpoView, PortfolioIpoViewModel>
    implements IPortfolioIpoViewWidgetModel {
  PortfolioIpoViewWidgetModel(PortfolioIpoViewModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadIpoList();
  }

  /// Получение списков pre-ipo
  Future<void> _loadIpoList() async {
    final previousData = _ipoListState.value?.data;
    _ipoListState.loading(previousData);

    try {
      final res = await model.getPreIpoStockList();
      _ipoListState.content(res ?? []);
    } on Exception catch (e) {
      _ipoListState.error(e, previousData);
    }
  }

  final _ipoListState = EntityStateNotifier<List<StockDomain>>();

  @override
  ListenableState<EntityState<List<StockDomain>>> get ipoListState =>
      _ipoListState;
}
