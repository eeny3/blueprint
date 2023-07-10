import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_trade/domain/user_profile_domain.dart';
import 'package:one_trade/interactors/profile/profile_interactor.dart';
import 'package:one_trade/ui/user_profile/user_personals/user_personals.dart';
import 'package:one_trade/ui/user_profile/user_personals/user_personals_model.dart';
import 'package:one_trade/ui/user_profile/widgets/popup/date_picker_dialog.dart';
import 'package:one_trade/ui/widgets/popup/show_popup.dart';
import 'package:one_trade/utils/inject.dart';

/// Абстракция Widget Model для личных данных пользователя
abstract class IUserPersonalsWidgetModel extends IWidgetModel {
  /// Контроллер для фамилии
  TextEditingController get lastNameEditingController;

  /// Контроллер для имени
  TextEditingController get firstNameEditingController;

  /// Контроллер для отчества
  TextEditingController get secondNameEditingController;

  /// Контроллер для даты рождения
  TextEditingController get dayOfBirthEditingController;

  /// Контроллер для адреса
  // TODO: geo autocomplete?
  TextEditingController get addressEditingController;

  /// Действие по нажатию назад
  void goBack();

  /// Показать диалог с выбором даты
  void showDatePicker();
}

UserPersonalsWidgetModel defaultAppWidgetModelFactory(BuildContext context) {
  return UserPersonalsWidgetModel(
    UserPersonalsScreenModel(
      standardErrorHandler,
      inject<UserProfileInteractor>(),
    ),
  );
}

/// Имплементация и реализация Виджет модели [IUserPersonalsWidgetModel]
class UserPersonalsWidgetModel
    extends WidgetModel<UserPersonalsScreen, UserPersonalsScreenModel>
    implements IUserPersonalsWidgetModel {
  UserPersonalsWidgetModel(UserPersonalsScreenModel model) : super(model);

  /// Информация о пользователе
  StateNotifier<UserProfileDomain?> get userProfileState =>
      model.userProfileState;

  /// Контроллер для имени
  @override
  late final firstNameEditingController = _createTextEditingController(
    userProfileState.value?.firstName,
    _firstNameEnterTimer,
    _debounceTime,
    () => model.setUserAttribute(
      UserProfileAttributesEnum.firstName,
      firstNameEditingController.text,
    ),
  );

  /// Таймер для подсчета времени ввода имени
  Timer? _firstNameEnterTimer;

  /// Контроллер для фамилии
  @override
  late final TextEditingController lastNameEditingController =
      _createTextEditingController(
    userProfileState.value?.lastName,
    _lastNameEnterTimer,
    _debounceTime,
    () => model.setUserAttribute(
      UserProfileAttributesEnum.lastName,
      lastNameEditingController.text,
    ),
  );

  /// Таймер для подсчета времени ввода фамилии
  Timer? _lastNameEnterTimer;

  /// Контроллер для отчества
  @override
  late final TextEditingController secondNameEditingController =
      _createTextEditingController(
    userProfileState.value?.secondName,
    _secondNameEnterTimer,
    _debounceTime,
    () => model.setUserAttribute(
      UserProfileAttributesEnum.secondName,
      secondNameEditingController.text,
    ),
  );

  /// Таймер для подсчета времени ввода отчества
  Timer? _secondNameEnterTimer;

  /// Контроллер для даты рождения
  @override
  late final TextEditingController dayOfBirthEditingController =
      _createTextEditingController(
    userProfileState.value?.dayOfBirth,
    _dayOfBirthNameEnterTimer,
    _debounceTime,
    () => model.setUserAttribute(
      UserProfileAttributesEnum.dayOfBirth,
      dayOfBirthEditingController.text,
    ),
  );

  /// Таймер для подсчета времени ввода даты рождения
  Timer? _dayOfBirthNameEnterTimer;

  /// Контроллер для адресса
  @override
  late final TextEditingController addressEditingController =
      _createTextEditingController(
          // TODO: получать данные с адресом
          '',
          _addressNameEnterTimer,
          _debounceTime,
          () => {
                // TODO: Совершать отправку
              });

  /// Таймер для подсчета времени ввода адреса
  Timer? _addressNameEnterTimer;

  /// Время после которого осуществлять действие
  final int _debounceTime = 1000;

  /// Текущая выбранная пользователем дата
  String? currentChosenDate;

  /// Действие по нажатию назад
  @override
  void goBack() {
    Navigator.of(context).pop();
  }

  /// Показать диалог с выбором даты
  @override
  void showDatePicker() {
    showPopUp(
      context,
      DatePickerDialogBody(
        onDateChanged: onDateChanged,
        onDateSaved: onDateSaved,
      ),
    );
  }

  /// Действие при изменении выбора даты
  void onDateChanged(DateTime chosenDate) {
    String formattedDate = DateFormat('dd.MM.yyyy').format(chosenDate);
    currentChosenDate = formattedDate;
  }

  /// Действие при сохранении даты
  void onDateSaved() {
    if (currentChosenDate != null) {
      model.setUserAttribute(
        UserProfileAttributesEnum.dayOfBirth,
        currentChosenDate!,
      );
      dayOfBirthEditingController.text = currentChosenDate!;
    }
    Navigator.of(context).pop();
  }

  /// Метод для создания контроллера для текствого поля с задержкой
  TextEditingController _createTextEditingController(
    String? initialValue,
    Timer? timer,
    int debounceTime,
    VoidCallback action,
  ) {
    TextEditingController textEditingController =
        TextEditingController(text: initialValue ?? '');
    textEditingController.addListener(
      () => _fieldEditingListener(
        textEditingController,
        timer,
        debounceTime,
        action,
      ),
    );

    return textEditingController;
  }

  /// Обработчик действий пользователя с задержкой
  void _fieldEditingListener(
    TextEditingController controller,
    Timer? timer,
    int debounceTime,
    VoidCallback action,
  ) {
    if (timer?.isActive ?? false) {
      timer?.cancel();
    }
    timer = Timer(
      Duration(milliseconds: debounceTime),
      () {
        if (controller.text != "") {
          action.call();
        }
      },
    );
  }
}
