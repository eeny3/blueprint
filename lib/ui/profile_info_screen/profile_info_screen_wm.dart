import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:one_trade/domains/registration_step_domain/registration_step_domain.dart';
import 'package:one_trade/service/account/account_interactor.dart';
import 'package:one_trade/ui/profile_info_screen/profile_info_screen.dart';
import 'package:one_trade/ui/profile_info_screen/profile_info_screen_model.dart';
import 'package:one_trade/utils/navigation_helper.dart';

ProfileInfoInputScreenWM createProfileInfoInputScreensWM(BuildContext _) =>
    ProfileInfoInputScreenWM(
      ProfileInfoInputScreenModel(
        GetIt.I<AccountInteractor>(),
      ),
      NavigationHelper(),
    );

class ProfileInfoInputScreenWM
    extends WidgetModel<ProfileInfoInputScreen, ProfileInfoInputScreenModel> {
  /// Состояние 4 шага регистрации
  EntityStateNotifier<RegistrationStepDomain> registrationFourthStepState =
      EntityStateNotifier();
  final NavigationHelper _navigator;

  /// Контроллер текстового поля для имени
  final firstNameController = TextEditingController();
  /// Контроллер текстового поля для фамилии
  final lastNameController = TextEditingController();
  /// Контроллер текстового поля для отчества
  final fathersNameController = TextEditingController();
  /// Контроллер текстового поля для даты рождения
  final dobController = TextEditingController();
  /// Контроллер текстового поля для адреса
  final addressController = TextEditingController();
  /// Контроллер текстового поля для почты
  final emailController = TextEditingController();

  ProfileInfoInputScreenWM(ProfileInfoInputScreenModel model, this._navigator)
      : super(model);

  //TODO переделать под новый апи
  /// Действие при нажатии на кнопку страницы
  // void onButtonPressed(String phone) async {
  //   final previousData = registrationFourthStepState.value?.data;
  //   registrationFourthStepState.loading();
  //   try {
  //     final response = await model.executeRegistrationFourthStep(
  //       phone,
  //       //TODO заменить 'us' на юрисдикцию
  //       'us',
  //       firstNameController.text,
  //       lastNameController.text,
  //       dobController.text,
  //       addressController.text,
  //       emailController.text,
  //     );
  //     registrationFourthStepState.content(response);
  //     _navigator.push(
  //       context,
  //       MaterialPageRoute<void>(
  //         //TODO верификация личности
  //         builder: (_) => Container(),
  //       ),
  //     );
  //   } on Exception catch (error) {
  //     registrationFourthStepState.error(error, previousData);
  //   }
  // }
}
