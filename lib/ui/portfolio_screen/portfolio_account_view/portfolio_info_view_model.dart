import 'package:elementary/elementary.dart';
import 'package:one_trade/domain/accounts_domain.dart';
import 'package:one_trade/interactors/account/account_interactor.dart';

/// Elementary model для страницы информации всех счетов пользователя
class PortfolioAccountsViewModel extends ElementaryModel {
  final AccountInteractor _accountInteractor;

  PortfolioAccountsViewModel(
    ErrorHandler errorHandler,
    this._accountInteractor,
  ) : super(errorHandler: errorHandler);

  /// Получение всех счетов пользователя
  Future<AccountsDomain?> getUserAccounts() =>
      _accountInteractor.getUserAccounts();
}
