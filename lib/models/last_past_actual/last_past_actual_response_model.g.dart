// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_past_actual_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastPastActualResponseModel _$LastPastActualResponseModelFromJson(
        Map<String, dynamic> json) =>
    LastPastActualResponseModel(
      otc: (json['otc'] as List<dynamic>?)
          ?.map((e) => StockResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ipoPast: (json['ipoPast'] as List<dynamic>?)
          ?.map((e) => StockResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ipoCurrent: (json['ipoCurrent'] as List<dynamic>?)
          ?.map((e) => StockResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LastPastActualResponseModelToJson(
        LastPastActualResponseModel instance) =>
    <String, dynamic>{
      'otc': instance.otc,
      'ipoPast': instance.ipoPast,
      'ipoCurrent': instance.ipoCurrent,
    };
