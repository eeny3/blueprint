import 'package:json_annotation/json_annotation.dart';

part 'finance_response_model.g.dart';

/// Модель ответа запроса финансовых операций пользователя
@JsonSerializable()
class FinanceResponseModel {
  int? id;
  int? login;
  int? type;
  int? system;
  String? amount;
  int? state;
  String? adminComment;
  DateTime? created;
  DateTime? updated;

  FinanceResponseModel({
    this.created,
    this.id,
    this.system,
    this.amount,
    this.state,
    this.type,
    this.login,
    this.adminComment,
    this.updated,
  });

  factory FinanceResponseModel.fromJson(Map<String, dynamic> json) {
    return _$FinanceResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FinanceResponseModelToJson(this);


}
