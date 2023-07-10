import 'package:one_trade/domain/finance_domain.dart';
import 'package:one_trade/models/finance_response/finance_response_model.dart';

FinanceDomain mapToFinanceDomain(FinanceResponseModel model) => FinanceDomain(
      created: model.created,
      id: model.id,
      system: model.system,
      amount: model.amount,
      state: model.state,
      type: model.type,
      login: model.login,
      adminComment: model.adminComment,
      updated: model.updated,
    );

List<FinanceDomain>? mapListToFinanceDomain(
  List<FinanceResponseModel>? list,
) =>
    list?.map((model) => mapToFinanceDomain(model)).toList();
