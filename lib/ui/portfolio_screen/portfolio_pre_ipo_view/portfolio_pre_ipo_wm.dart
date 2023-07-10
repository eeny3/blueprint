import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/di/di_container.dart';
import 'package:one_trade/domain/stock_domain.dart';
import 'package:one_trade/interactors/stock/stock_interactor.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_pre_ipo_view/portfolio_pre_ipo_view.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_pre_ipo_view/portfolio_pre_ipo_view_model.dart';
import 'package:one_trade/ui/pre_ipo_detail/pre_ipo_detail.dart';
import 'package:one_trade/utils/inject.dart';

abstract class IPortfolioPreIpoViewWidgetModel extends IWidgetModel {
  ListenableState<EntityState<List<StockDomain>>> get ipoListState;

  /// Навигация на IPO
  void navigateToIpo(StockDomain stockDomain);
}

PortfolioPreIpoViewWidgetModel defaultPortfolioPreIpoViewWidgetModelFactory(
    BuildContext context) {
  return PortfolioPreIpoViewWidgetModel(
    PortfolioPreIpoViewModel(
      standardErrorHandler,
      inject<StockInteractor>(),
    ),
  );
}

/// Elementary widget model для страницы pre ipo
class PortfolioPreIpoViewWidgetModel
    extends WidgetModel<PortfolioPreIpoView, PortfolioPreIpoViewModel>
    implements IPortfolioPreIpoViewWidgetModel {
  PortfolioPreIpoViewWidgetModel(PortfolioPreIpoViewModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadIpoList();
  }

  Future<void> _loadIpoList() async {
    final previousData = _ipoListState.value?.data;
    _ipoListState.loading(previousData);

    try {
      final res = await model.getPreIpoStockList();
      _ipoListState.content(res ?? []);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  final _ipoListState = EntityStateNotifier<List<StockDomain>>();

  @override
  ListenableState<EntityState<List<StockDomain>>> get ipoListState =>
      _ipoListState;

  @override
  void navigateToIpo(StockDomain stockDomain) => Navigator.of(context).push(
        PreIpoDetailScreenRoute(stockDomain),
      );
}
