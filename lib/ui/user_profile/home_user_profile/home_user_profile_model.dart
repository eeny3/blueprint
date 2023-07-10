import 'package:elementary/elementary.dart';
import 'package:one_trade/domain/user_profile_domain.dart';
import 'package:one_trade/interactors/locale/lang_code.dart';
import 'package:one_trade/interactors/locale/locale_interactor.dart';
import 'package:one_trade/interactors/profile/profile_interactor.dart';

/// Имплементация Elementary модели к профилю пользователя
class HomeUserProfileScreenModel extends ElementaryModel {
  /// Интерактор для взаимодействия с профилем
  final UserProfileInteractor _userProfileInteractor;

  /// Интректор для работы с локалью
  final LocaleInteractor _localeInteractor;

  /// Информация о пользователе
  StateNotifier<UserProfileDomain?> get userProfileState =>
      _userProfileInteractor.userProfileState;

  /// Контакты для связи
  StateNotifier<ContactSites?> get contactSitesState =>
      _userProfileInteractor.contactSitesState;

  HomeUserProfileScreenModel(
    ErrorHandler errorHandler,
    this._userProfileInteractor,
    this._localeInteractor,
  ) : super(
          errorHandler: errorHandler,
        );

  /// Получить информацию о пользователе
  Future<void> getUserProfile() => _userProfileInteractor.getUserProfileInfo();

  /// Получить контакты для связи
  Future<void> getContactSites() async {
    final contactSites = await _userProfileInteractor.getContactSites();
    contactSitesState.accept(contactSites);
  }

  /// Сменить локализацию приложения
  void changeLocale(LangCode langCode) {
    _localeInteractor.load(langCode);
  }
}
