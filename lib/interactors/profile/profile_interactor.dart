import 'package:elementary/elementary.dart';
import 'package:injectable/injectable.dart';
import 'package:one_trade/domain/user_profile_domain.dart';
import 'package:one_trade/repository/profile/profile_repository.dart';

/// Интерактор для профиля пользователя
abstract class UserProfileInteractor {
  /// Информация о пользователе
  StateNotifier<UserProfileDomain?> get userProfileState;

  /// Контакты
  StateNotifier<ContactSites?> get contactSitesState;

  /// Отправка запроса на получение данных о пользователе
  Future<UserProfileDomain?> getUserProfileInfo();

  /// Отправка запроса на редактирование данных пользователя
  Future<UserProfileDomain?> setUserProfileInfo({
    String? firstName,
    String? secondName,
    String? lastName,
    String? dayOfBirth,
  });

  /// Отправка запроса на получение способов связи для пользователя,
  /// чтобы получить поддержку
  Future<ContactSites> getContactSites();
}

/// Имплементация к классу [UserProfileInteractor]
@LazySingleton(as: UserProfileInteractor)
class ProfileInteractorImpl extends UserProfileInteractor {
  /// Информация о пользователе
  @override
  StateNotifier<UserProfileDomain> userProfileState =
      StateNotifier<UserProfileDomain>();

  /// Контакты для связи
  @override
  StateNotifier<ContactSites?> contactSitesState =
      StateNotifier<ContactSites?>();

  ProfileInteractorImpl(
    this._profileRepository,
  );

  /// Репозиторий профиля
  final ProfileRepository _profileRepository;

  /// Отправка запроса на получение данных о пользователе
  @override
  Future<UserProfileDomain?> getUserProfileInfo() async {
    UserProfileDomain? userProfileDomain =
        await _profileRepository.getUserProfileInfo();
    userProfileState.accept(userProfileDomain);

    return userProfileDomain;
  }

  /// Отправка запроса на редактирование данных пользователя
  @override
  Future<UserProfileDomain?> setUserProfileInfo({
    String? firstName,
    String? secondName,
    String? lastName,
    String? dayOfBirth,
  }) async {
    UserProfileDomain updatedUserProfileDomain =
        await _profileRepository.setUserProfileInfo(
      firstName: firstName,
      secondName: secondName,
      lastName: lastName,
      dayOfBirth: dayOfBirth,
    );
    UserProfileDomain? updatedUserProfileState =
        userProfileState.value?.update(updatedUserProfileDomain);
    userProfileState.accept(updatedUserProfileState);

    return updatedUserProfileState;
  }

  /// Отправка запроса на получение способов связи для пользователя,
  /// чтобы получить поддержку
  @override
  Future<ContactSites> getContactSites() async {
    ContactSites contactSites = await _profileRepository.getContactSites();
    contactSitesState.accept(contactSites);

    return contactSites;
  }
}
