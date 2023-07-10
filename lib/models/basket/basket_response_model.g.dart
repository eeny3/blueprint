// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketResponseModel _$BasketResponseModelFromJson(Map<String, dynamic> json) =>
    BasketResponseModel(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      login: json['login'] as int?,
      status: json['status'] as int?,
      adminComment: json['adminComment'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      basketStocks: (json['basketStocks'] as List<dynamic>?)
          ?.map((e) =>
              BasketStockResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BasketResponseModelToJson(
        BasketResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'login': instance.login,
      'status': instance.status,
      'adminComment': instance.adminComment,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'basketStocks': instance.basketStocks,
      'price': instance.price,
    };
