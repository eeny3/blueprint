import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/di/di_container.dart';
import 'package:one_trade/domain/account_domain.dart';
import 'package:one_trade/interactors/account/account_interactor.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_all_accounts/portfolio_all_accounts_screen.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_all_accounts/portfolio_all_accounts_screen_model.dart';
import 'package:one_trade/utils/inject.dart';

abstract class IPortfolioAllAccountsScreenWidgetModel extends IWidgetModel {
  ListenableState<EntityState<List<AccountDomain>>> get investListState;

  StateNotifier<String?> get queryState;

  StateNotifier<int> get currentTabState;

  /// Редактирование поля поиска
  void onSearchChanged(String query);

  /// Навигация назад
  void goBack();

  /// Изменение таба
  changeTab(int i);
}

PortfolioAllAccountsScreenWidgetModel defaultAppWidgetModelFactory(
    BuildContext context) {
  return PortfolioAllAccountsScreenWidgetModel(
    PortfolioAllAccountsScreenModel(
      standardErrorHandler,
      inject<AccountInteractor>(),
    ),
  );
}

/// Elementary widget model для страницы всех счетов пользователя
class PortfolioAllAccountsScreenWidgetModel extends WidgetModel<
        PortfolioAllAccountsScreen, PortfolioAllAccountsScreenModel>
    implements IPortfolioAllAccountsScreenWidgetModel {
  PortfolioAllAccountsScreenWidgetModel(PortfolioAllAccountsScreenModel model)
      : super(model);

  final _investList = EntityStateNotifier<List<AccountDomain>>();

  @override
  final queryState = StateNotifier<String?>();

  @override
  final currentTabState = StateNotifier<int>(initValue: 0);

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
      debugPrint(e.toString());
    }
  }

  /// Редактирование поля поиска
  @override
  void onSearchChanged(String query) {
    queryState.accept(query);
  }

  /// Навигация назад
  @override
  void goBack() => Navigator.of(context).pop();

  /// Изменение таба
  @override
  changeTab(int i) {
    currentTabState.accept(i);
  }
}
