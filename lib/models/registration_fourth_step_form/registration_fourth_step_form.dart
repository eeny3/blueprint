import 'package:json_annotation/json_annotation.dart';

part 'registration_fourth_step_form.g.dart';

/// Модель для тела запроса четвертого шага регистрации
@JsonSerializable()
class RegistrationFourthStepFormModel {
  /// номер телефона
  @JsonKey()
  final String phone;
  /// юрисдикция
  @JsonKey()
  final String jurisdiction;
  /// фамилия
  @JsonKey()
  final String firstname;
  /// имя
  @JsonKey()
  final String lastname;
  /// дата рождения
  @JsonKey()
  final String dob;
  /// адрес
  @JsonKey()
  final String address;
  /// email
  @JsonKey()
  final String email;

  RegistrationFourthStepFormModel({
    required this.phone,
    required this.jurisdiction,
    required this.firstname,
    required this.lastname,
    required this.dob,
    required this.address,
    required this.email,
  });

  factory RegistrationFourthStepFormModel.fromJson(Map<String, dynamic> json) {
    return _$RegistrationFourthStepFormModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegistrationFourthStepFormModelToJson(this);
  }
}