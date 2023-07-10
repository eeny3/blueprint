import 'package:injectable/injectable.dart';
import 'package:one_trade/domain/user_profile_domain.dart';
import 'package:one_trade/models/profile/mapper/profile_mapper.dart';
import 'package:one_trade/service/networking/profile_api/profile_api.dart';

/// Репозиторий для работы с запросами, связанными с профилем.
abstract class ProfileRepository {
  /// Отправка запроса на получение данных о пользователе
  Future<UserProfileDomain?> getUserProfileInfo();

  /// Отправка запроса на редактирование данных пользователя
  Future<UserProfileDomain> setUserProfileInfo({
    String? firstName,
    String? secondName,
    String? lastName,
    String? dayOfBirth,
  });

  /// Отправка запроса на получение способов связи для пользователя,
  /// чтобы получить поддержку
  Future<ContactSites> getContactSites();
}

/// Имплементация к [AccountRepository]
@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRepositoryImpl(
    this._profileApi,
  );

  final ProfileApi _profileApi;

  /// Отправка запроса на получение данных о пользователе
  @override
  Future<UserProfileDomain?> getUserProfileInfo() async {
    final response = await _profileApi.getUserProfileInfo();
    if (response.user != null) {
      return mapToUserProfile(response.user!);
    }

    return null;
  }

  /// Отправка запроса на редактирование данных пользователя
  @override
  Future<UserProfileDomain> setUserProfileInfo({
    String? firstName,
    String? secondName,
    String? lastName,
    String? dayOfBirth,
  }) async {
    final response = await _profileApi.setUserProfileInfo(
      firstName: firstName,
      secondName: secondName,
      lastName: lastName,
      dayOfBirth: dayOfBirth,
    );

    return mapToUserProfile(response);
  }

  /// Отправка запроса на получение способов связи для пользователя,
  /// чтобы получить поддержку
  @override
  Future<ContactSites> getContactSites() async {
    final response = await _profileApi.getContactSites();

    return mapToContactSites(response);
  }
}
