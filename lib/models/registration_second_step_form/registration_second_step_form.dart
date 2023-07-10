import 'package:json_annotation/json_annotation.dart';

part 'registration_second_step_form.g.dart';

/// Модель для тела запроса второго шага регистрации
@JsonSerializable()
class RegistrationSecondStepFormModel {
  /// id юзера
  @JsonKey()
  final String id;
  /// ОТП код
  @JsonKey()
  final String code;

  RegistrationSecondStepFormModel({
    required this.id,
    required this.code,
  });

  factory RegistrationSecondStepFormModel.fromJson(Map<String, dynamic> json) {
    return _$RegistrationSecondStepFormModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegistrationSecondStepFormModelToJson(this);
  }
}
