import 'package:one_trade/domain/last_past_actual_domain.dart';
import 'package:one_trade/models/stock_response/stock_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'last_past_actual_response_model.g.dart';

/// Модель ответа запроса для списков прошедших и нынишних ipo
@JsonSerializable()
class LastPastActualResponseModel {
  List<StockResponseModel>? otc;
  List<StockResponseModel>? ipoPast;
  List<StockResponseModel>? ipoCurrent;

  LastPastActualResponseModel({
    this.otc,
    this.ipoPast,
    this.ipoCurrent,
  });

  factory LastPastActualResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LastPastActualResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LastPastActualResponseModelToJson(this);
  }
}
