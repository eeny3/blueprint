import 'package:elementary/elementary.dart';
import 'package:one_trade/interactors/order/order_interactor.dart';

/// Elementary model для страницы информации закрытых сделок пользователя
class PortfolioDetailDealsViewClosedModel extends ElementaryModel {
  final int login;
  final OrderInteractor _orderInteractor;

  PortfolioDetailDealsViewClosedModel(
    ErrorHandler errorHandler,
    this._orderInteractor, {
    required this.login,
  }) : super(errorHandler: errorHandler);

  /// Получение завершенных заказов ipo пользователя
  getClosedOrders({required int login}) => _orderInteractor.getClosedOrders(login: login);
}
