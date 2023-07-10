import 'package:one_trade/domain/basket_domain.dart';
import 'package:one_trade/domain/basket_stock_domain.dart';
import 'package:one_trade/models/basket/basket_response_model.dart';
import 'package:one_trade/models/basket/basket_stock_response_model.dart';
import 'package:one_trade/models/stock_response/mapper/stock_mapper.dart';

BasketDomain mapToBasketDomain(BasketResponseModel model) => BasketDomain(
      id: model.id,
      userId: model.userId,
      login: model.login,
      status: model.status,
      adminComment: model.adminComment,
      created: model.created,
      updated: model.updated,
      basketStocks:
          model.basketStocks?.map((e) => mapToBasketStockDomain(e)).toList(),
      price: model.price,
    );

BasketStockDomain mapToBasketStockDomain(BasketStockResponseModel model) =>
    BasketStockDomain(
      id: model.id,
      stock: model.stock != null ? mapToStock(model.stock!) : null,
      count: model.count,
      price: model.price,
    );

List<BasketDomain>? mapListToBasketDomain(
  List<BasketResponseModel>? list,
) =>
    list?.map((model) => mapToBasketDomain(model)).toList();
