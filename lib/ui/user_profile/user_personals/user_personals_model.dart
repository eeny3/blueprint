import 'package:elementary/elementary.dart';
import 'package:one_trade/domain/user_profile_domain.dart';
import 'package:one_trade/interactors/profile/profile_interactor.dart';

/// Имплементация Elementary модели к личным данным пользователя
class UserPersonalsScreenModel extends ElementaryModel {
  /// Интерактор ядл взаимодействия с профилем
  final UserProfileInteractor _userProfileInteractor;

  /// Информация о пользователе
  StateNotifier<UserProfileDomain?> get userProfileState =>
      _userProfileInteractor.userProfileState;

  UserPersonalsScreenModel(
    ErrorHandler errorHandler,
    this._userProfileInteractor,
  ) : super(errorHandler: errorHandler);

  /// Запрос на изменение данных пользователя
  void setUserAttribute(UserProfileAttributesEnum attribute, String value) {
    switch (attribute) {
      case UserProfileAttributesEnum.firstName:
        _userProfileInteractor.setUserProfileInfo(
          firstName: value,
        );
        break;
      case UserProfileAttributesEnum.secondName:
        _userProfileInteractor.setUserProfileInfo(
          secondName: value,
        );
        break;
      case UserProfileAttributesEnum.lastName:
        _userProfileInteractor.setUserProfileInfo(
          lastName: value,
        );
        break;
      case UserProfileAttributesEnum.dayOfBirth:
        _userProfileInteractor.setUserProfileInfo(
          dayOfBirth: value,
        );
        break;
      case UserProfileAttributesEnum.address:
        //_userProfileInteractor.setUserProfileInfo();
        break;
    }
  }
}
