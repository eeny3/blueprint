import 'package:one_trade/domain/stock_domain.dart';

/// Доменная модель элемента корзины
class BasketStockDomain {
  int? id;
  StockDomain? stock;
  int? count;
  double? price;

  BasketStockDomain({
    this.id,
    this.stock,
    this.count,
    this.price,
  });
}
