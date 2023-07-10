import 'package:injectable/injectable.dart';
import 'package:one_trade/domain/order_domain.dart';
import 'package:one_trade/models/order/mapper/order_mapper.dart';
import 'package:one_trade/models/order/order_response_model.dart';
import 'package:one_trade/service/networking/account_api/account_api.dart';

/// Репозиторий для работы с запросами связаныый с заказами
abstract class OrderRepository {
  /// Отправка запроса на получение завершенных заказов ipo пользователя
  Future<List<OrderDomain>?> getClosedOrders({
    required int login,
  });

  /// Отправка запроса на получение открытых заказов ipo пользователя
  Future<List<OrderDomain>?> getOpenedOrders({
    required int login,
  });
}

/// имплементация к [OrderRepository]
@Injectable(as: OrderRepository)
class OrderRepositoryImpl extends OrderRepository {
  OrderRepositoryImpl({
    required this.accountApi,
  });

  AccountApi accountApi;

  /// Отправка запроса на получение завершенных заказов ipo пользователя
  @override
  Future<List<OrderDomain>?> getClosedOrders({
    required int login,
  }) async {
    final response = await accountApi.getClosedOrders(
      login: login,
    );

    return mapListToOrder(response);
  }

  /// Отправка запроса на получение открытых заказов ipo пользователя
  @override
  Future<List<OrderDomain>?> getOpenedOrders({
    required int login,
  }) async {
    final response = await accountApi.getOpenedOrders(
      login: login,
    );

    return mapListToOrder(response);
  }
}
