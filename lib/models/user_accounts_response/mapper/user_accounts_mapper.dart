import 'package:one_trade/domain/accounts_domain.dart';
import 'package:one_trade/models/account/mapper/account_mapper.dart';
import 'package:one_trade/models/user_accounts_response/user_accounts_response_model.dart';

AccountsDomain mapToAccounts(UserAccountsResponseModel model) => AccountsDomain(
      brokerList:
          model.brokerList?.map((model) => mapToAccount(model)).toList(),
      investList:
          model.investList?.map((model) => mapToAccount(model)).toList(),
      mt5List: model.mt5List?.map((model) => mapToAccount(model)).toList(),
    );
