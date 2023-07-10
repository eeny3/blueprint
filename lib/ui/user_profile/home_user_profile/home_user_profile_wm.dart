import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/interactors/locale/lang_code.dart';
import 'package:one_trade/interactors/locale/locale_interactor.dart';
import 'package:one_trade/interactors/profile/profile_interactor.dart';
import 'package:one_trade/ui/user_profile/home_user_profile/home_user_profile.dart';
import 'package:one_trade/ui/user_profile/home_user_profile/home_user_profile_model.dart';
import 'package:one_trade/ui/user_profile/user_personals/user_personals.dart';
import 'package:one_trade/ui/user_profile/user_rules/user_rules.dart';
import 'package:one_trade/ui/user_profile/widgets/popup/contacts_dialog.dart';
import 'package:one_trade/ui/user_profile/widgets/popup/language_select_dialog.dart';
import 'package:one_trade/ui/user_profile/widgets/popup/personal_account_redirect_dialog.dart';
import 'package:one_trade/ui/verification_screen/verification_screen.dart';
import 'package:one_trade/ui/widgets/popup/show_popup.dart';
import 'package:one_trade/utils/inject.dart';
import 'package:url_launcher/url_launcher.dart';

/// Абстракция Widget Model для профиля пользователя
abstract class IHomeUserProfileWidgetModel extends IWidgetModel {
  /// Имя пользователя
  StateNotifier<String?> get userNameState;

  /// Показатель того, верифицирован ли пользователь
  StateNotifier<bool> get userVerifiedState;

  /// Действие по нажатию назад
  void goBack();

  /// Переход к верификации
  void onVerificationTapped();

  /// Переход к редактированию персоанальных данных
  void onPersonalDataTapped();

  /// Нажатие на кнопку изменения номера телефона
  void onChangePhoneNumberTapped();

  /// Нажатие на кнопку изменения адреса электронной почты
  void onChangeEmailTapped();

  /// Переход к правилам и соглашениям
  void onRulesTapped();

  /// Переход к выбору языка
  void onSelectLanguageTapped();

  /// Переход к возможности получить связь
  void onContactUsTapped();

  /// Действие по нажатию на кнопку выйти
  void onExitTapped();
}

HomeUserProfileWidgetModel defaultAppWidgetModelFactory(BuildContext context) {
  return HomeUserProfileWidgetModel(
    HomeUserProfileScreenModel(
      standardErrorHandler,
      inject<UserProfileInteractor>(),
      inject<LocaleInteractor>(),
    ),
  );
}

/// Имплементация и реализация Виджет модели [IHomeUserProfileWidgetModel]
class HomeUserProfileWidgetModel
    extends WidgetModel<HomeUserProfileScreen, HomeUserProfileScreenModel>
    implements IHomeUserProfileWidgetModel {
  HomeUserProfileWidgetModel(HomeUserProfileScreenModel model) : super(model);

  /// Имя пользователя
  @override
  StateNotifier<String?> userNameState = StateNotifier<String?>();

  /// Показатель того, верифицирован ли пользователь
  @override
  StateNotifier<bool> userVerifiedState = StateNotifier<bool>();

  @override
  void initWidgetModel() {
    model.getUserProfile();
    model.getContactSites();
    model.userProfileState.addListener(() {
      userNameState.accept(model.userProfileState.value?.firstName);
      userVerifiedState.accept(model.userProfileState.value?.isUserVerified);
    });
    super.initWidgetModel();
  }

  /// Действие по нажатию назад
  @override
  void goBack() {
    Navigator.of(context).pop();
  }

  /// Переход к верификации
  @override
  void onVerificationTapped() {
    Navigator.of(context).push(
      // Копировано из phone_input_screen_wm.dart
      MaterialPageRoute<void>(
        builder: (_) => VerificationScreen(
          model.userProfileState.value?.phone ?? '',
          //TODO переделать под новый апи
          '+79250000000',
        ),
      ),
    );
  }

  /// Переход к редактированию персоанальных данных
  @override
  void onPersonalDataTapped() {
    Navigator.of(context).push(UserPersonalsScreenRoute());
  }

  /// Нажатие на кнопку изменения адреса электронной почты
  @override
  void onChangeEmailTapped() {
    showPopUp(
      context,
      PersonalAccountRedirectDialogBody(
        onGoToPersonalAccountTapped: onGoToPersonalAccountTapped,
      ),
    );
  }

  /// Нажатие на кнопку изменения номера телефона
  @override
  void onChangePhoneNumberTapped() {
    showPopUp(
      context,
      PersonalAccountRedirectDialogBody(
        onGoToPersonalAccountTapped: onGoToPersonalAccountTapped,
      ),
    );
  }

  /// Переход к правилам и соглашениям
  @override
  void onRulesTapped() {
    Navigator.of(context).push(UserRulesScreenRoute());
  }

  /// Переход к возможности получить связь
  @override
  void onContactUsTapped() {
    showPopUp(
      context,
      ContactsDialogBody(
        onWriteLetterTapped: onWriteLetterTapped,
        onOnlineChatTapped: onOnlineChatTapped,
        onWhatsAppTapped: onWhatsAppTapped,
        onTelegramTapped: onTelegramTapped,
        onCallTapped: onCallTapped,
      ),
    );
  }

  /// Переход к выбору языка
  @override
  void onSelectLanguageTapped() {
    showPopUp(
      context,
      LanguageSelectDialogBody(
        onChangeLanguageTapped: onChangeLanguageTapped,
      ),
    );
  }

  /// Действие по нажатию на язык
  void onChangeLanguageTapped(LangCode langCode) {
    model.changeLocale(langCode);
  }

  /// Действие по нажатию на кнопку перехода к личному кабинету
  void onGoToPersonalAccountTapped() async {
    String url = "https://cabinet.devmtm.xyz/";
    await launch(url);
  }

  /// Переход к написанию письма
  void onWriteLetterTapped() {
    String? contactMail = model.contactSitesState.value?.email;
    launch("mailto:$contactMail");
  }

  /// Переход к онлайн чату
  void onOnlineChatTapped() {
    // TODO: переход к онлайн чату
  }

  /// Переход к WhatsApp
  void onWhatsAppTapped() async {
    String? whatsappContactPhone = model.contactSitesState.value?.phone;
    String url = "whatsapp://send?phone=$whatsappContactPhone";
    await launch(url);
  }

  /// Переход в Telegram
  void onTelegramTapped() async {
    String? telegramContact = model.contactSitesState.value?.telegram;
    String url = "$telegramContact";
    launch(url);
  }

  /// Осуществление звонка
  void onCallTapped() {
    String? contactPhone = model.contactSitesState.value?.phone;
    launch("tel:$contactPhone");
  }

  /// Действие по нажатию на кнопку выйти
  @override
  void onExitTapped() {
    // TODO: осуществить логаут
  }
}
