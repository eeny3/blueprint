import 'package:json_annotation/json_annotation.dart';
import 'package:one_trade/models/basket/basket_stock_response_model.dart';

part 'basket_response_model.g.dart';

/// Модель покупок в корзине
@JsonSerializable()
class BasketResponseModel {
  int? id;
  int? userId;
  int? login;
  int? status;
  String? adminComment;
  DateTime? created;
  DateTime? updated;
  List<BasketStockResponseModel>? basketStocks;
  double? price;

  BasketResponseModel({
    this.id,
    this.userId,
    this.login,
    this.status,
    this.adminComment,
    this.created,
    this.updated,
    this.basketStocks,
    this.price,
  });

  factory BasketResponseModel.fromJson(Map<String, dynamic> json) {
    return _$BasketResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BasketResponseModelToJson(this);


}
