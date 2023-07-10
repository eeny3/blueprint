import 'package:injectable/injectable.dart';
import 'package:one_trade/models/finance_response/finance_response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'finance_api.g.dart';

/// Класс для запросов финансов
@singleton
@RestApi(baseUrl: '')
abstract class FinanceApi {
  @factoryMethod
  factory FinanceApi(Dio dio) = _FinanceApi;

  /// Получение списка транзакции счета по типу (-1 вывод, 1 пополнение)
  @GET('/api/v3/finance/list')
  Future<List<FinanceResponseModel>> getFinanceList({
    @Query('login') int? login,
    @Query('type') required int type,
  });
}
