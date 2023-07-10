import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/domains/login_domain/login_domain.dart';
import 'package:one_trade/service/account/account_interactor.dart';
import 'package:one_trade/ui/password_input_screen/password_input_screen.dart';
import 'package:one_trade/ui/password_input_screen/password_input_screen_model.dart';
import 'package:one_trade/ui/profile_info_screen/profile_info_screen.dart';
import 'package:one_trade/utils/inject.dart';
import 'package:one_trade/utils/navigation_helper.dart';

PasswordInputScreenWM createPasswordInputScreensWM(BuildContext _) =>
    PasswordInputScreenWM(
      PasswordInputScreenModel(
        inject<AccountInteractor>(),
      ),
      NavigationHelper(),
    );

class PasswordInputScreenWM
    extends WidgetModel<PasswordInputScreen, PasswordInputScreenModel> {
  /// Состояние 3 шага регистрации
  EntityStateNotifier<LoginDomain> registrationThirdStepState =
      EntityStateNotifier();
  final NavigationHelper _navigator;

  /// Состояние кнопки экрана
  StateNotifier<bool> buttonState = StateNotifier(initValue: false);

  /// Контроллер поля ввода пароля
  final controller = TextEditingController();

  PasswordInputScreenWM(PasswordInputScreenModel model, this._navigator)
      : super(model);

  /// Действие при нажатии на кнопку страницы
  void onButtonPressed(String id, String username, String password) async {
    if (controller.text == password) {
      final previousData = registrationThirdStepState.value?.data;
      registrationThirdStepState.loading();
      try {
        //TODO временный мок на юрисдикцию
        final domain = await model.executeRegistrationThirdStep(
            id, controller.text, username);
        registrationThirdStepState.content(domain);
        _navigator.push(
          context,
          MaterialPageRoute<void>(
            //TODO переделать под другой апи
            builder: (_) => ProfileInfoInputScreen(
              username,
              'us',
            ),
          ),
        );
      } on Exception catch (error) {
        registrationThirdStepState.error(error, previousData);
      }
    } else {
      //TODO узнать как обрабатывать ошибки у дизайнера
      debugPrint('Пароли не совпадают');
    }
  }

  /// Действие при изменении поля ввода пароля
  void onTextFieldChanged(String newValue) {
    newValue.isEmpty ? buttonState.accept(false) : buttonState.accept(true);
  }

  @override
  void dispose() {
    controller.dispose();
    buttonState.dispose();
    super.dispose();
  }
}
