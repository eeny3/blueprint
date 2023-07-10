import 'package:one_trade/domain/order_domain.dart';
import 'package:one_trade/models/order/order_response_model.dart';

OrderDomain mapToOrder(OrderResponseModel model) => OrderDomain(
  id: model.id,
  symbol: model.symbol,
  stock: model.stock,
  volume: model.volume,
  openPrice: model.openPrice,
  profit: model.profit,
  openTime: model.openTime,
  type: model.type,
  commissionOpen: model.commissionOpen,
  price: model.price,
  currentPrice: model.currentPrice,
  currentPricePercent: model.currentPricePercent,
  increase: model.increase,
  increasePercent: model.increasePercent,
);

List<OrderDomain>? mapListToOrder(
  List<OrderResponseModel>? list,
) =>
    list?.map((model) => mapToOrder(model)).toList();
