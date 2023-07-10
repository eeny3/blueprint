import 'package:json_annotation/json_annotation.dart';

part 'registration_first_step_form.g.dart';

/// Модель для тела запроса первого шага регистрации
@JsonSerializable()
class RegistrationFirstStepFormModel {
  /// Номер телефона
  @JsonKey()
  final String phone;

  /// По свагеру непонятно что это за поле
  @JsonKey()
  final String message;

  RegistrationFirstStepFormModel({
    required this.phone,
    required this.message,
  });

  factory RegistrationFirstStepFormModel.fromJson(Map<String, dynamic> json) {
    return _$RegistrationFirstStepFormModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegistrationFirstStepFormModelToJson(this);
  }
}
