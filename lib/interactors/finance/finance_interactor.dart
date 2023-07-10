import 'package:injectable/injectable.dart';
import 'package:one_trade/domain/finance_domain.dart';
import 'package:one_trade/models/finance_response/mapper/finance_mapper.dart';
import 'package:one_trade/repository/finance/finance_repository.dart';

/// Интерактор для запросов связанной со финансами
abstract class FinanceInteractor {
  /// Получение списка пополнении счета
  Future<List<FinanceDomain>?> getOperationsIncome({
    int? login,
  });

  /// Получение списка выводов счета
  Future<List<FinanceDomain>?> getOperationsWithdraw({
    int? login,
  });
}

/// Имплеменация к классу [FinanceInteractor]
@LazySingleton(as: FinanceInteractor)
class FinanceInteractorImpl extends FinanceInteractor {
  FinanceInteractorImpl({
    required this.financeRepository,
  });

  final FinanceRepository financeRepository;

  /// Получение списка пополнении счета
  @override
  Future<List<FinanceDomain>?> getOperationsIncome({
    int? login,
  }) async =>
      financeRepository.getOperationsIncome(
        login: login,
      );

  /// Получение списка выводов счета
  @override
  Future<List<FinanceDomain>?> getOperationsWithdraw({int? login}) async =>
      financeRepository.getOperationsWithdraw(
        login: login,
      );
}
