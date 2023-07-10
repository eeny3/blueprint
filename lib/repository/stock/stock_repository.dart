import 'package:injectable/injectable.dart';
import 'package:one_trade/domain/stock_domain.dart';
import 'package:one_trade/models/stock_response/mapper/stock_mapper.dart';
import 'package:one_trade/service/networking/stock_api/stock_api.dart';

/// Репозиторий для отправки запросов связанный со стоками(ipo)
abstract class StockRepository {
  /// Получение списков ipo по категории
  Future<List<StockDomain>?> getStockListByCategory({
    required int categoryId,
  });

  /// Получение списков ipo по id
  Future<StockDomain> getStockById({
    required int id,
  });
}

/// Имплементация к [StockRepository]
@Injectable(as: StockRepository)
class StockRepositoryImpl extends StockRepository {
  StockRepositoryImpl({
    required this.stockApi,
  });

  StockApi stockApi;

  /// Получение списков ipo по категории
  @override
  Future<List<StockDomain>?> getStockListByCategory({
    required int categoryId,
  }) async =>
      mapListToStock(await stockApi.getStockList(categoryId: categoryId));

  /// Получение списков ipo по id
  @override
  Future<StockDomain> getStockById({
    required int id,
  }) async =>
      mapToStock(await stockApi.getStockById(id: id));
}
