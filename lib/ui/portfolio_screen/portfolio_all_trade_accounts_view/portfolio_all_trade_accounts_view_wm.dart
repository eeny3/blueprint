import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/di/di_container.dart';
import 'package:one_trade/domain/account_domain.dart';
import 'package:one_trade/interactors/account/account_interactor.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_all_trade_accounts_view/portfolio_all_trade_accounts_view.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_all_trade_accounts_view/portfolio_all_trade_accounts_view_model.dart';
import 'package:one_trade/utils/inject.dart';

abstract class IPortfolioAllTradeAccountsViewWidgetModel extends IWidgetModel {
  ListenableState<EntityState<List<AccountDomain>>> get brokerList;

  StateNotifier<String?> get queryState;

  /// Редактирование поля поиска
  void onSearchChanged(String query);
}

PortfolioAllTradeAccountsViewWidgetModel defaultAppWidgetModelFactory(
    BuildContext context) {
  return PortfolioAllTradeAccountsViewWidgetModel(
      PortfolioAllTradeAccountsViewModel(
    standardErrorHandler,
    inject<AccountInteractor>(),
  ));
}

/// Elementary widget model для страницы всех счетов торговли пользователя
class PortfolioAllTradeAccountsViewWidgetModel extends WidgetModel<
        PortfolioAllTradeAccountsView, PortfolioAllTradeAccountsViewModel>
    implements IPortfolioAllTradeAccountsViewWidgetModel {
  PortfolioAllTradeAccountsViewWidgetModel(
      PortfolioAllTradeAccountsViewModel model)
      : super(model);

  final _brokerList =
      EntityStateNotifier<List<AccountDomain>>(const EntityState(data: []));

  @override
  ListenableState<EntityState<List<AccountDomain>>> get brokerList =>
      _brokerList;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadIpoList();
  }

  /// Получение всех счетов пользователя
  Future<void> _loadIpoList() async {
    final previousData = _brokerList.value?.data;
    _brokerList.loading(previousData);

    try {
      final res = await model.getUserAccounts();
      _brokerList.content(res?.brokerList ?? []);
    } on Exception catch (e) {
      _brokerList.error(e, previousData);
    }
  }

  /// Редактирование поля поиска
  @override
  void onSearchChanged(String query) {
    queryState.accept(query);
  }

  @override
  final queryState = StateNotifier<String?>();
}
