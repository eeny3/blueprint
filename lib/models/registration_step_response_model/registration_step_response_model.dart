import 'package:json_annotation/json_annotation.dart';
import 'package:one_trade/models/error/error_model.dart';
import 'package:one_trade/models/result/response_result_model.dart';

part 'registration_step_response_model.g.dart';

/// Модель для респонса запросов шагов регистрации
@JsonSerializable()
class RegistrationStepResponseModel {
  /// Id юзера
  @JsonKey()
  final String id;

  RegistrationStepResponseModel(
    this.id,
  );

  factory RegistrationStepResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$RegistrationStepResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegistrationStepResponseModelToJson(this);
  }
}
