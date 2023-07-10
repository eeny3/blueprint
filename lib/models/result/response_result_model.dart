import 'package:json_annotation/json_annotation.dart';

part 'response_result_model.g.dart';

/// Стандатное поле с месседжем во всех респонсах
@JsonSerializable()
class ResponseResultModel {
  /// Месседж
  @JsonKey()
  final String message;

  ResponseResultModel({
    required this.message,
  });

  factory ResponseResultModel.fromJson(Map<String, dynamic> json) {
    return _$ResponseResultModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResponseResultModelToJson(this);
  }
}
