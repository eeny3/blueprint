import 'package:one_trade/resources/strings/common_strings.dart';

/// Доменная модель профиля пользователя
class UserProfileDomain {
  /// Фамилия
  String lastName;

  /// Имя
  String firstName;

  /// Отчество
  String secondName;

  /// Дата рождения
  String dayOfBirth;

  /// Является ли пользователь верифицированным
  bool isUserVerified;

  /// Номер телефона
  String phone;

  UserProfileDomain({
    String? lastName,
    String? firstName,
    String? secondName,
    String? dayOfBirth,
    String? phone,
    bool? isUserVerified,
  })  : lastName = lastName ?? emptyString,
        firstName = firstName ?? emptyString,
        secondName = secondName ?? emptyString,
        dayOfBirth = dayOfBirth ?? emptyString,
        phone = phone ?? emptyString,
        isUserVerified = isUserVerified ?? false;

  /// Обновляет данные о пользователе полями из нового экземляра
  UserProfileDomain update(UserProfileDomain newValue) {
    return UserProfileDomain(
      lastName: newValue.lastName,
      firstName: newValue.firstName,
      secondName: newValue.secondName,
      dayOfBirth: newValue.dayOfBirth,
      isUserVerified: newValue.isUserVerified,
    );
  }
}

/// Перечисление полей данных пользователя
enum UserProfileAttributesEnum {
  /// Фамилия
  firstName,

  /// Имя
  secondName,

  /// Отчество
  lastName,

  /// Дата рождения
  dayOfBirth,

  /// Адресс
  address,
}

/// Доменная модель для контактов для получения поддержки
class ContactSites {
  /// Электронная почта
  String email;

  /// Номер телефона
  String phone;

  /// Телеграмм-канал
  String telegram;

  ContactSites({
    String? email,
    String? phone,
    String? telegram,
  })  : email = email ?? emptyString,
        phone = phone ?? emptyString,
        telegram = telegram ?? emptyString;
}
