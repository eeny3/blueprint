import 'package:injectable/injectable.dart';
import 'package:one_trade/domain/order_domain.dart';
import 'package:one_trade/models/order/mapper/order_mapper.dart';
import 'package:one_trade/repository/order/order_repository.dart';

/// Интерактор для запросов связанной со стоками
abstract class OrderInteractor {
  /// Получение завершенных заказов ipo пользователя
  Future<List<OrderDomain>?> getClosedOrders({
    required int login,
  });

  /// Получение открытых заказов ipo пользователя
  Future<List<OrderDomain>?> getOpenedOrders({
    required int login,
  });
}

/// Имплеменация к классу [OrderInteractor]
@LazySingleton(as: OrderInteractor)
class OrderInteractorImpl extends OrderInteractor {
  OrderInteractorImpl({
    required this.orderRepository,
  });

  final OrderRepository orderRepository;

  /// Получение завершенных заказов ipo пользователя
  @override
  Future<List<OrderDomain>?> getClosedOrders({required int login}) async =>
      orderRepository.getClosedOrders(login: login);

  /// Получение открытых заказов ipo пользователя
  @override
  Future<List<OrderDomain>?> getOpenedOrders({required int login}) async =>
      orderRepository.getOpenedOrders(login: login);
}
