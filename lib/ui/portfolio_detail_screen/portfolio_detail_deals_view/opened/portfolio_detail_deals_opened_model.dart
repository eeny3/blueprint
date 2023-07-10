import 'package:elementary/elementary.dart';
import 'package:one_trade/domain/order_domain.dart';
import 'package:one_trade/interactors/order/order_interactor.dart';

/// Elementary model для страницы информации открытых сделок пользователя
class PortfolioDetailDealsViewOpenedModel extends ElementaryModel {
  final int login;
  final OrderInteractor _orderInteractor;

  PortfolioDetailDealsViewOpenedModel(
    ErrorHandler errorHandler,
    this._orderInteractor, {
    required this.login,
  }) : super(errorHandler: errorHandler);

  /// Получение открытых заказов ipo пользователя
  Future<List<OrderDomain>?> getOpenedOrders({required int login}) =>
      _orderInteractor.getOpenedOrders(login: login);
}
