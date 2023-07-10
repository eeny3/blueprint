import 'package:elementary/elementary.dart';
import 'package:one_trade/domain/accounts_domain.dart';
import 'package:one_trade/interactors/account/account_interactor.dart';

/// Elementary model для страницы всех счетов инвестиции пользователя
class PortfolioAllInvestAccountsViewModel extends ElementaryModel {
  final AccountInteractor _accountInteractor;

  PortfolioAllInvestAccountsViewModel(
    ErrorHandler errorHandler,
    this._accountInteractor,
  ) : super(errorHandler: errorHandler);

  /// Получение всех счетов пользователя
  Future<AccountsDomain?> getUserAccounts() =>
      _accountInteractor.getUserAccounts();
}
