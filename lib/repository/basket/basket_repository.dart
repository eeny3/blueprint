import 'package:injectable/injectable.dart';
import 'package:one_trade/domain/basket_domain.dart';
import 'package:one_trade/models/basket/basket_response_model.dart';
import 'package:one_trade/models/basket/mapper/basket_mapper.dart';
import 'package:one_trade/service/networking/basket_api/basket_api.dart';

/// Репозиторий для отправки запросов связанный с корзиной
abstract class BasketRepository {
  /// Отправка запроса на получение всех элементов корзины пользователя
  Future<List<BasketDomain>?> getBasketList();
}

/// имплементация к [BasketRepository]
@Injectable(as: BasketRepository)
class BasketRepositoryImpl extends BasketRepository {
  BasketRepositoryImpl({
    required this.basketApi,
  });

  BasketApi basketApi;

  /// Отправка запроса на получение всех элементов корзины пользователя
  @override
  Future<List<BasketDomain>?> getBasketList() async =>
      mapListToBasketDomain(await basketApi.getBasketList());
}
