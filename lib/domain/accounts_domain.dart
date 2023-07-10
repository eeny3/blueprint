import 'package:one_trade/domain/account_domain.dart';

/// Доменная модель списков счетов пользователя
class AccountsDomain {
  List<AccountDomain> brokerList;
  List<AccountDomain> investList;
  List<AccountDomain> mt5List;

  AccountsDomain({
    List<AccountDomain>? brokerList,
    List<AccountDomain>? investList,
    List<AccountDomain>? mt5List,
  })  : brokerList = brokerList ?? [],
        investList = investList ?? [],
        mt5List = mt5List ?? [];
}
