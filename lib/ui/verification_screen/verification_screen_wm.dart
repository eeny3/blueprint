import 'dart:async';

import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/service/account/account_interactor.dart';
import 'package:one_trade/ui/password_input_screen/create_password_screen.dart';
import 'package:one_trade/ui/password_input_screen/password_input_screen.dart';
import 'package:one_trade/ui/verification_screen/states/code_data.dart';
import 'package:one_trade/ui/verification_screen/verification_screen.dart';
import 'package:one_trade/ui/verification_screen/verification_screen_model.dart';
import 'package:one_trade/utils/inject.dart';
import 'package:one_trade/utils/navigation_helper.dart';

VerificationScreenWM createVerificationScreensWM(BuildContext _) =>
    VerificationScreenWM(
      VerificationScreenModel(
        standardErrorHandler,
        inject<AccountInteractor>(),
      ),
      NavigationHelper(),
    );

class VerificationScreenWM
    extends WidgetModel<VerificationScreen, VerificationScreenModel> {
  /// Состояние 2 шага регистрации
  EntityStateNotifier<void> registrationSecondStepState = EntityStateNotifier();

  /// Состояние введенного кода
  late StateNotifier<VerificationCodeData> codeState;

  /// Данные введенного кода верификации
  VerificationCodeData code = VerificationCodeData();
  final NavigationHelper _navigator;

  /// Значение для максимальной длины кода
  final int maxCodeInputLength = 4;

  /// Состояние времени в секундах до возможности повторного запроса кода
  late final StateNotifier<int> countdownState =
  StateNotifier(initValue: _countdown);
  Timer? _timer;
  int _countdown = 120;
  final int otpSuccessCode = 204;

  /// Возможность повторного запроса кода
  bool get isCanResendCode {
    return _countdown <= 0;
  }

  VerificationScreenWM(VerificationScreenModel model, this._navigator)
      : super(model);

  @override
  void initWidgetModel() {
    codeState = StateNotifier(initValue: code);
    _restartTimer();
    super.initWidgetModel();
  }

  void popScreen() {
    _navigator.pop(context);
  }

  /// Действие при нажатии на цифру клавиатуры
  void onNumberTapped(String value, String id, String phone) {
    if (codeState.value!.code.length < maxCodeInputLength) {
      code.code = code.code + value;
    }
    VerificationCodeData tempState =
    VerificationCodeData(code: code.code, isCorrect: code.isCorrect);
    codeState.accept(tempState);
    if (code.code.length == maxCodeInputLength) {
      onCodeInputFilled(value, id, phone);
    }
  }

  /// Действие при нажатии на backspace клавиатуры
  void onBackspaceTapped() {
    if (!code.isCorrect) {
      code.isCorrect = true;
      VerificationCodeData tempState =
      VerificationCodeData(code: code.code, isCorrect: code.isCorrect);
      codeState.accept(tempState);
    }
    if (code.code.isNotEmpty) {
      code.code = code.code.substring(0, code.code.length - 1);
    }
    VerificationCodeData tempState =
    VerificationCodeData(code: code.code, isCorrect: code.isCorrect);
    codeState.accept(tempState);
  }

  /// Действие при заполнении кода
  onCodeInputFilled(String value, String id, String phone) async {
    registrationSecondStepState.loading();
    try {
      final domain = await model.verifyCode(
        id,
        code.code,
      );
      registrationSecondStepState.content(domain);
      _navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (_) => CreatePasswordScreen(phone: phone, id: id),
        ),
      );
    } on Exception catch (error) {
      registrationSecondStepState.error(error);
    }
  }

  void _restartTimer() {
    _countdown = 120;
    countdownState.accept(_countdown);
    _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  }

  void _onTick(Timer timer) {
    _countdown--;
    countdownState.accept(_countdown);
    if (_countdown == 0) {
      _timer?.cancel();
    }
  }

  /// Запрос кода
  Future<void> requestCode(String phone) async {
    //TODO заменить моки
    model.requestCode(phone);
    _restartTimer();
  }

  @override
  void onErrorHandle(Object error) {
    super.onErrorHandle(error);
    if (error is DioError) {
      if (error.response?.statusCode != otpSuccessCode) {
        code.isCorrect = false;
        VerificationCodeData newState =
        VerificationCodeData(code: code.code, isCorrect: code.isCorrect);
        codeState.accept(newState);
      }
    }
  }

  @override
  void dispose() {
    countdownState.dispose();
    codeState.dispose();
    super.dispose();
  }
}
