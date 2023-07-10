import 'package:injectable/injectable.dart';
import 'package:one_trade/domain/account_domain.dart';
import 'package:one_trade/domain/accounts_domain.dart';
import 'package:one_trade/models/account/mapper/account_mapper.dart';
import 'package:one_trade/models/user_accounts_response/mapper/user_accounts_mapper.dart';
import 'package:one_trade/repository/account/account_repository.dart';

/// Интерактор связанный с работой со счетами
abstract class AccountInteractor {
  /// Получение всех счетов пользователя
  Future<AccountsDomain?> getUserAccounts();

  /// Открытие счета пользователя
  Future<AccountDomain?> createAccount({
    required String accountName,
  });

  /// Редактирование счета пользователя
  Future<AccountDomain?> updateAccount({
    required String accountName,
    required String login,
  });
}

/// Имплементация к [AccountInteractor]
@LazySingleton(as: AccountInteractor)
class AccountInteractorImpl extends AccountInteractor {
  AccountInteractorImpl({
    required this.accountRepository,
  });

  final AccountRepository accountRepository;

  /// Получение всех счетов пользователя
  @override
  Future<AccountDomain?> createAccount({
    required String accountName,
  }) async =>
      accountRepository.createAccount(
        accountName: accountName,
      );

  /// Открытие счета пользователя
  @override
  Future<AccountsDomain> getUserAccounts() async =>
      accountRepository.getUserAccounts();

  /// Редактирование счета пользователя
  @override
  Future<AccountDomain> updateAccount({
    required String accountName,
    required String login,
  }) async =>
      accountRepository.updateAccount(
        accountName: accountName,
        login: login,
      );
}
