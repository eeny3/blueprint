import 'package:one_trade/domain/basket_stock_domain.dart';
import 'package:one_trade/resources/strings/common_strings.dart';

/// Доменная модель корзины
class BasketDomain {
  int? id;
  int? userId;
  int? login;
  int? status;
  DateTime? created;
  DateTime? updated;
  List<BasketStockDomain> basketStocks;
  double? price;
  String adminComment;

  BasketDomain({
    this.id,
    this.userId,
    this.login,
    this.status,
    String? adminComment,
    this.created,
    this.updated,
    List<BasketStockDomain>? basketStocks,
    this.price,
  })  : adminComment = adminComment ?? emptyString,
        basketStocks = basketStocks ?? [];
}
