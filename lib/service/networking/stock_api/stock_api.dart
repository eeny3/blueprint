import 'package:injectable/injectable.dart';
import 'package:one_trade/models/last_past_actual/last_past_actual_response_model.dart';
import 'package:one_trade/models/stock_response/stock_response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'stock_api.g.dart';

/// Класс для запросов стока(ipo)
@singleton
@RestApi(baseUrl: '')
abstract class StockApi {
  @factoryMethod
  factory StockApi(Dio dio) = _StockApi;

  /// Получение списков ipo актуальных и прошедших
  @GET('/api/v3/stock/last-past-actual')
  Future<LastPastActualResponseModel> getStockLastPastActual();

  /// Получение списков ipo по категории
  @GET('/api/v3/stock')
  Future<List<StockResponseModel>> getStockList({
    @Query('category') required int categoryId,
  });

  /// Получение списков ipo по id
  @GET('/api/v3/stock/{id}')
  Future<StockResponseModel> getStockById({
    @Query('id') required int id,
  });
}
