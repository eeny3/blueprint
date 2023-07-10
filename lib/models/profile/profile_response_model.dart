import 'package:json_annotation/json_annotation.dart';

part 'profile_response_model.g.dart';

/// Модель респонса информации о пользователе
@JsonSerializable()
class UserProfileResponseModelRoot {
  UserProfileResponseModel? user;

  UserProfileResponseModelRoot({
    this.user,
  });

  factory UserProfileResponseModelRoot.fromJson(Map<String, dynamic> json) {
    return _$UserProfileResponseModelRootFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserProfileResponseModelRootToJson(this);
  }
}

/// Модель профиля пользователя
@JsonSerializable()
class UserProfileResponseModel {
  /// Фамилия пользователя
  String? lastName;

  /// Имя пользователя
  String? firstName;

  /// Отчество пользователя
  String? secondName;

  /// Дата рождения
  String? dob;

  /// Телефон
  String? phone;

  /// Является ли пользователь верефицированным
  bool? verified;

  UserProfileResponseModel({
    this.lastName,
    this.firstName,
    this.secondName,
    this.phone,
    this.dob,
    this.verified,
  });

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UserProfileResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserProfileResponseModelToJson(this);
  }
}

/// Модель контактов для получения поддержки
@JsonSerializable()
class ContactSiteResponseModel {
  /// Почта
  @JsonKey(name: "EMAIL")
  String? email;

  /// Телефон для связи
  @JsonKey(name: "PHONE")
  String? phone;

  /// Телеграм канал
  @JsonKey(name: "TELEGRAM")
  String? telegram;

  ContactSiteResponseModel({
    this.email,
    this.phone,
    this.telegram,
  });

  factory ContactSiteResponseModel.fromJson(Map<String, dynamic> json) {
    return _$ContactSiteResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ContactSiteResponseModelToJson(this);
  }
}
