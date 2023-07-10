import 'package:injectable/injectable.dart';
import 'package:one_trade/models/stock_response/mapper/stock_mapper.dart';
import 'package:one_trade/domain/stock_domain.dart';
import 'package:one_trade/repository/stock/stock_repository.dart';

/// Интерактор для запросов связанной со стоками
abstract class StockInteractor {

  /// Получение списков pre-ipo
  Future<List<StockDomain>?> getPreIpoStockList();

  /// Получение списков ipo
  Future<List<StockDomain>?> getIpoStockList();

  /// Получение списков ipo по id
  Future<StockDomain?> getStockById({
    required int id,
  });
}

/// Имплеменация к классу [StockInteractor]
@LazySingleton(as: StockInteractor)
class StockRepositoryImpl extends StockInteractor {
  StockRepositoryImpl({
    required this.stockRepository,
  });

  final StockRepository stockRepository;

  /// Получение списков pre-ipo
  @override
  Future<List<StockDomain>?> getIpoStockList() async =>
      stockRepository.getStockListByCategory(categoryId: 5);

  /// Получение списков ipo
  @override
  Future<List<StockDomain>?> getPreIpoStockList() async =>
      stockRepository.getStockListByCategory(categoryId: 6);

  /// Получение списков ipo по id
  @override
  Future<StockDomain?> getStockById({required int id}) async =>
      stockRepository.getStockById(id: id);
}
