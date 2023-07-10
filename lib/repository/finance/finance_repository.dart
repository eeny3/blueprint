import 'package:injectable/injectable.dart';
import 'package:one_trade/domain/finance_domain.dart';
import 'package:one_trade/models/finance_response/mapper/finance_mapper.dart';
import 'package:one_trade/service/networking/finance_api/finance_api.dart';

/// Класс для отправки запросов связанный с финансами
abstract class FinanceRepository {
  /// Получение списка пополнении счета
  Future<List<FinanceDomain>?> getOperationsIncome({
    int? login,
  });

  /// Получение списка выводов счета
  Future<List<FinanceDomain>?> getOperationsWithdraw({
    int? login,
  });
}

/// имплементация к [FinanceRepository]
@Injectable(as: FinanceRepository)
class FinanceRepositoryImpl extends FinanceRepository {
  FinanceRepositoryImpl({
    required this.financeApi,
  });

  FinanceApi financeApi;

  /// Получение списка пополнении счета
  @override
  Future<List<FinanceDomain>?> getOperationsIncome({int? login}) async =>
      mapListToFinanceDomain(await financeApi.getFinanceList(
        type: 1,
        login: login,
      ));

  /// Получение списка выводов счета
  @override
  Future<List<FinanceDomain>?> getOperationsWithdraw({int? login}) async =>
      mapListToFinanceDomain(await financeApi.getFinanceList(
        type: -1,
        login: login,
      ));
}
