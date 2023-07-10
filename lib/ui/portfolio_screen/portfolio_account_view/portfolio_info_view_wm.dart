import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/di/di_container.dart';
import 'package:one_trade/domain/account_domain.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_account_view/portfolio_accounts_view.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_account_view/portfolio_info_view_model.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_all_accounts/portfolio_all_accounts_screen.dart';
import 'package:one_trade/utils/inject.dart';

import '../../../interactors/account/account_interactor.dart';

abstract class IPortfolioAccountsViewWidgetModel extends IWidgetModel {
  ListenableState<EntityState<bool>> get isTradeState;

  ListenableState<EntityState<List<AccountDomain>>> get brokerList;

  /// Навигация на выбор счета
  void selectAccount();
}

PortfolioAccountsViewWidgetModel defaultAppWidgetModelFactory(
    BuildContext context) {
  return PortfolioAccountsViewWidgetModel(PortfolioAccountsViewModel(
    standardErrorHandler,
    inject<AccountInteractor>(),
  ));
}

/// Elementary widget model для страницы информации всех счетов пользователя
class PortfolioAccountsViewWidgetModel
    extends WidgetModel<PortfolioAccountsView, PortfolioAccountsViewModel>
    implements IPortfolioAccountsViewWidgetModel {
  PortfolioAccountsViewWidgetModel(PortfolioAccountsViewModel model)
      : super(model);

  final _isTradeState = EntityStateNotifier<bool>();
  final _brokerList = EntityStateNotifier<List<AccountDomain>>();

  @override
  ListenableState<EntityState<bool>> get isTradeState => _isTradeState;

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

  /// Навигация на выбор счета
  @override
  void selectAccount() => Navigator.of(context).push(
        PortfolioAllAccountsScreenRoute(),
      );
}
