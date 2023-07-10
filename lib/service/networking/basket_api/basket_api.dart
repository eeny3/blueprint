import 'package:injectable/injectable.dart';
import 'package:one_trade/models/basket/basket_response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'basket_api.g.dart';

/// Класс для запросов корзиной
@singleton
@RestApi(baseUrl: '')
abstract class BasketApi {
  @factoryMethod
  factory BasketApi(Dio dio) = _BasketApi;

  /// Отправка запроса на получение всех элементов корзины пользователя
  @GET('/api/v3/basket/list')
  Future<List<BasketResponseModel>> getBasketList();
}
