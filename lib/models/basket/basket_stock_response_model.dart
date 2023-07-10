import 'package:json_annotation/json_annotation.dart';
import 'package:one_trade/models/stock_response/stock_response_model.dart';

part 'basket_stock_response_model.g.dart';

/// Модель элемента корзины
@JsonSerializable()
class BasketStockResponseModel {
  int? id;
  StockResponseModel? stock;
  int? count;
  double? price;

  BasketStockResponseModel({
    this.id,
    this.stock,
    this.count,
    this.price,
  });

  factory BasketStockResponseModel.fromJson(Map<String, dynamic> json) {
    return _$BasketStockResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BasketStockResponseModelToJson(this);
}
