import 'package:json_annotation/json_annotation.dart';

part 'registration_third_step_form.g.dart';

/// Модель для тела запроса третьего шага регистрации
@JsonSerializable()
class RegistrationThirdStepFormModel {
  /// username
  @JsonKey()
  final String username;
  /// id юзера
  @JsonKey()
  final String id;
  /// Пароль
  @JsonKey()
  final String password;

  RegistrationThirdStepFormModel({
    required this.username,
    required this.id,
    required this.password,
  });

  factory RegistrationThirdStepFormModel.fromJson(Map<String, dynamic> json) {
    return _$RegistrationThirdStepFormModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegistrationThirdStepFormModelToJson(this);
  }
}