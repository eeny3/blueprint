// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_stock_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketStockResponseModel _$BasketStockResponseModelFromJson(
        Map<String, dynamic> json) =>
    BasketStockResponseModel(
      id: json['id'] as int?,
      stock: json['stock'] == null
          ? null
          : StockResponseModel.fromJson(json['stock'] as Map<String, dynamic>),
      count: json['count'] as int?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BasketStockResponseModelToJson(
        BasketStockResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stock': instance.stock,
      'count': instance.count,
      'price': instance.price,
    };
