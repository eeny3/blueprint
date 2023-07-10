import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/di/di_container.dart';
import 'package:one_trade/domain/account_domain.dart';
import 'package:one_trade/interactors/account/account_interactor.dart';
import 'package:one_trade/repository/account/account_repository.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_all_invest_accounts_view/portfolio_all_invest_accounts_view.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_all_invest_accounts_view/portfolio_all_invest_accounts_view_model.dart';
import 'package:one_trade/utils/inject.dart';

abstract class IPortfolioAllInvestAccountsViewWidgetModel extends IWidgetModel {
  ListenableState<EntityState<List<AccountDomain>>> get investListState;

  StateNotifier<String?> get queryState;

  /// Редактирование поля поиска
  void onSearchChanged(String query);
}

PortfolioAllInvestAccountsViewWidgetModel defaultAppWidgetModelFactory(
    BuildContext context) {
  return PortfolioAllInvestAccountsViewWidgetModel(
      PortfolioAllInvestAccountsViewModel(
    standardErrorHandler,
    inject<AccountInteractor>(),
  ));
}

/// Elementary widget model для страницы всех счетов инвестиции пользователя
class PortfolioAllInvestAccountsViewWidgetModel extends WidgetModel<
        PortfolioAllInvestAccountsView, PortfolioAllInvestAccountsViewModel>
    implements IPortfolioAllInvestAccountsViewWidgetModel {
  PortfolioAllInvestAccountsViewWidgetModel(
      PortfolioAllInvestAccountsViewModel model)
      : super(model);

  final _investList = EntityStateNotifier<List<AccountDomain>>();

  @override
  final queryState = StateNotifier<String?>();

  @override
  ListenableState<EntityState<List<AccountDomain>>> get investListState =>
      _investList;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadIpoList();
  }

  /// Получение всех счетов пользователя
  Future<void> _loadIpoList() async {
    final previousData = _investList.value?.data;
    _investList.loading(previousData);

    try {
      final res = await model.getUserAccounts();
      _investList.content(res?.investList ?? []);
    } on Exception catch (e) {
      _investList.error(e, previousData);
    }
  }

  /// Редактирование поля поиска
  @override
  void onSearchChanged(String query) {
    queryState.accept(query);
  }
}
