import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/domains/registration_step_domain/registration_step_domain.dart';
import 'package:one_trade/service/account/account_interactor.dart';
import 'package:one_trade/ui/password_input_screen/password_input_screen.dart';
import 'package:one_trade/ui/phone_input_screen/phone_input_screen.dart';
import 'package:one_trade/ui/phone_input_screen/phone_input_screen_model.dart';
import 'package:one_trade/ui/phone_input_screen/widgets/phone_textfield.dart';
import 'package:one_trade/ui/verification_screen/verification_screen.dart';
import 'package:one_trade/utils/inject.dart';
import 'package:one_trade/utils/navigation_helper.dart';

class PhoneInputScreenWM
    extends WidgetModel<PhoneInputScreen, PhoneInputScreenModel> {
  /// Состояние 1 шага регистрации
  final EntityStateNotifier<RegistrationStepDomain> registrationFirstStepState =
  EntityStateNotifier();
  final NavigationHelper _navigator;
  /// Контроллер поля ввода номера телефона
  final controller = TextEditingController();
  /// Значение минимальной допустимой длины номера телефона
  final int minPhoneInputLength = 0;

  PhoneInputScreenWM(PhoneInputScreenModel model, this._navigator)
      : super(model);

  /// Действие при нажатии на галочку на клавиатуре
  void onCheckTapped() async {
    final previousData = registrationFirstStepState.value?.data;
    registrationFirstStepState.loading();
    try {
      final domain = await model.executeRegistrationFirstStep(
        countryCode + controller.text,
      );
      registrationFirstStepState.content(domain);
      _navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (_) => VerificationScreen(
            registrationFirstStepState.value?.data?.id ?? '',
            countryCode + controller.text,
          ),
        ),
      );
    } on Exception catch (error) {
      registrationFirstStepState.error(error, previousData);
    }
  }

  /// Действие при нажатии на цифру на клавиатуре
  void onNumberTapped(String value) {
    controller.text = controller.text + value;
  }

  /// Действие при нажатии на backspace на клавиатуре
  void onBackspaceTapped() {
    if (controller.text.length > minPhoneInputLength) {
      controller.text =
          controller.text.substring(0, controller.text.length - 1);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    registrationFirstStepState.dispose();
    super.dispose();
  }
}

PhoneInputScreenWM createPhoneInputScreensWM(BuildContext _) =>
    PhoneInputScreenWM(
      PhoneInputScreenModel(
        standardErrorHandler,
        inject<AccountInteractor>(),
      ),
      NavigationHelper(),
    );
