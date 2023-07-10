// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponseModel _$OrderResponseModelFromJson(Map<String, dynamic> json) =>
    OrderResponseModel(
      id: json['id'] as int?,
      symbol: json['symbol'] as String?,
      stock: json['stock'],
      volume: (json['volume'] as num?)?.toDouble(),
      openPrice: (json['openPrice'] as num?)?.toDouble(),
      profit: json['profit'],
      openTime: json['openTime'] == null
          ? null
          : DateTime.parse(json['openTime'] as String),
      type: json['type'] as int?,
      commissionOpen: (json['commissionOpen'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      currentPrice: (json['currentPrice'] as num?)?.toDouble(),
      currentPricePercent: (json['currentPricePercent'] as num?)?.toDouble(),
      increase: (json['increase'] as num?)?.toDouble(),
      increasePercent: (json['increasePercent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderResponseModelToJson(OrderResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'stock': instance.stock,
      'volume': instance.volume,
      'openPrice': instance.openPrice,
      'profit': instance.profit,
      'openTime': instance.openTime?.toIso8601String(),
      'type': instance.type,
      'commissionOpen': instance.commissionOpen,
      'price': instance.price,
      'currentPrice': instance.currentPrice,
      'currentPricePercent': instance.currentPricePercent,
      'increase': instance.increase,
      'increasePercent': instance.increasePercent,
    };
