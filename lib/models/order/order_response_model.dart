import 'package:json_annotation/json_annotation.dart';

part 'order_response_model.g.dart';

/// Модель ответа запроса заказа пользователя
@JsonSerializable()
class OrderResponseModel {
  int? id;
  String? symbol;
  dynamic stock;
  double? volume;
  double? openPrice;
  dynamic profit;
  DateTime? openTime;
  int? type;
  double? commissionOpen;
  double? price;
  double? currentPrice;
  double? currentPricePercent;
  double? increase;
  double? increasePercent;

  OrderResponseModel({
    this.id,
    this.symbol,
    this.stock,
    this.volume,
    this.openPrice,
    this.profit,
    this.openTime,
    this.type,
    this.commissionOpen,
    this.price,
    this.currentPrice,
    this.currentPricePercent,
    this.increase,
    this.increasePercent,
  });

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) {
    return _$OrderResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderResponseModelToJson(this);
  }


}
