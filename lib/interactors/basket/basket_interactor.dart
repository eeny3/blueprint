import 'package:injectable/injectable.dart';
import 'package:one_trade/domain/basket_domain.dart';
import 'package:one_trade/models/basket/mapper/basket_mapper.dart';
import 'package:one_trade/repository/basket/basket_repository.dart';

/// Интерактор для запросов связанной со корзиной
abstract class BasketInteractor {

  /// Получение всех элементов корзины пользователя
  Future<List<BasketDomain>?> getBasketList();
}

/// Имплеменация к классу [BasketInteractor]
@LazySingleton(as: BasketInteractor)
class BasketInteractorImpl extends BasketInteractor {
  BasketInteractorImpl({
    required this.basketRepository,
  });

  final BasketRepository basketRepository;

  /// Получение всех элементов корзины пользователя
  @override
  Future<List<BasketDomain>?> getBasketList() async =>
      basketRepository.getBasketList();
}
