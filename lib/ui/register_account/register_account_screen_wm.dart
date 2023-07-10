import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/di/di_container.dart';
import 'package:one_trade/domain/account_domain.dart';
import 'package:one_trade/interactors/account/account_interactor.dart';
import 'package:one_trade/ui/register_account/register_account_screen.dart';
import 'package:one_trade/ui/register_account/register_account_screen_model.dart';
import 'package:one_trade/ui/register_account_success/register_account_success_screen.dart';
import 'package:one_trade/utils/inject.dart';

/// Абстракция Widget Model для Регистрация счета
abstract class IRegisterAccountScreenWidgetModel extends IWidgetModel {
  StateNotifier<String?> get accountName;

  StateNotifier<AccountDomain> get createdAccount;

  /// Изменение название нового счета
  void accountNameChanged(String value);

  /// Открытие счета пользователя
  void createAccount();

  /// Навигация назад
  void goBack();
}

RegisterAccountScreenWidgetModel defaultAppWidgetModelFactory(
    BuildContext context) {
  return RegisterAccountScreenWidgetModel(RegisterAccountScreenModel(
    standardErrorHandler,
    inject<AccountInteractor>(),
  ));
}

/// Имплементация и реализация Виджет модели [IRegisterAccountScreenWidgetModel]
class RegisterAccountScreenWidgetModel
    extends WidgetModel<RegisterAccountScreen, RegisterAccountScreenModel>
    implements IRegisterAccountScreenWidgetModel {
  RegisterAccountScreenWidgetModel(RegisterAccountScreenModel model)
      : super(model);

  @override
  final accountName = StateNotifier<String?>();

  @override
  final createdAccount = StateNotifier<AccountDomain>();

  /// Изменение название нового счета
  @override
  void accountNameChanged(String value) {
    accountName.accept(value);
  }

  /// Открытие счета пользователя
  @override
  Future<void> createAccount() async {
    try {
      final res =
          await model.createAccount(accountName: accountName.value ?? '');
      if (res != null) {
        createdAccount.accept(res);
        Navigator.of(context).push(
          RegisterAccountSuccessScreenRoute(res),
        );
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Навигация назад
  @override
  void goBack() => Navigator.of(context).pop();
}
