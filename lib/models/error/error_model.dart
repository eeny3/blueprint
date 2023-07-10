import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

/// Модель для информации об ошибке при шаге регистрации
@JsonSerializable()
class ErrorModel {
  /// Код ошибки
  @JsonKey()
  final int code;
  /// Месседж ошибки
  @JsonKey()
  final String message;

  ErrorModel({
    required this.code,
    required this.message,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return _$ErrorModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ErrorModelToJson(this);
  }
}
