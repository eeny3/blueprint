import 'package:injectable/injectable.dart';
import 'package:one_trade/domain/account_domain.dart';
import 'package:one_trade/domain/accounts_domain.dart';
import 'package:one_trade/models/account/account_response_model.dart';
import 'package:one_trade/models/account/mapper/account_mapper.dart';
import 'package:one_trade/models/user_accounts_response/mapper/user_accounts_mapper.dart';
import 'package:one_trade/models/user_accounts_response/user_accounts_response_model.dart';
import 'package:one_trade/service/networking/account_api/account_api.dart';

/// Репозиторий для работы с запросами связаныый с счетами
abstract class AccountRepository {

  /// Отправка запроса получение всех счетов пользователя
  Future<AccountsDomain> getUserAccounts();

  /// Отправка запроса на открытие счета пользователя
  Future<AccountDomain> createAccount({
    required String accountName,
  });

  /// Отправка запроса на редактирование счета пользователя
  Future<AccountDomain> updateAccount({
    required String accountName,
    required String login,
  });
}

/// Имплементация к [AccountRepository]
@Injectable(as: AccountRepository)
class AccountRepositoryImpl extends AccountRepository {
  AccountRepositoryImpl({
    required this.accountApi,
  });

  AccountApi accountApi;

  /// Отправка запроса на открытие счета пользователя
  @override
  Future<AccountDomain> createAccount({required String accountName}) async {
    final response = await accountApi.createAccount(
      customName: accountName,
    );

    return mapToAccount(response);
  }

  /// Отправка запроса получение всех счетов пользователя
  @override
  Future<AccountsDomain> getUserAccounts() async {
    final response = await accountApi.getUserAccounts();

    return mapToAccounts(response);
  }

  /// Отправка запроса на редактирование счета пользователя
  @override
  Future<AccountDomain> updateAccount({
    required String accountName,
    required String login,
  }) async {
    final response = await accountApi.updateAccount(
      login: login,
      customName: accountName,
    );

    return mapToAccount(response);
  }
}
