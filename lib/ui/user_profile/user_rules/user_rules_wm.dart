import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/ui/user_profile/user_rules/user_rules.dart';
import 'package:one_trade/ui/user_profile/user_rules/user_rules_model.dart';
import 'package:one_trade/utils/inject.dart';

/// Абстракция Widget Model для пользовательских соглашений
abstract class IUserRulesWidgetModel extends IWidgetModel {
  /// Переход к политике конфиденциальности
  void onPrivacyPolicyTapped();

  /// Переход к пользовательскому соглашению
  void onUserAgreementTapped();

  /// Переход к согласию на обработку персональных данных
  void onPersonalDataProcessingTapped();

  /// Переход к правилам продажи товаров
  void onSellingRulesTapped();

  /// Действие по нажатию назад
  void goBack();
}

UserRulesWidgetModel defaultAppWidgetModelFactory(BuildContext context) {
  return UserRulesWidgetModel(
    UserRulesScreenModel(
      standardErrorHandler,
    ),
  );
}

/// Имплементация и реализация Виджет модели [IUserRulesWidgetModel]
class UserRulesWidgetModel
    extends WidgetModel<UserRulesScreen, UserRulesScreenModel>
    implements IUserRulesWidgetModel {
  UserRulesWidgetModel(
    UserRulesScreenModel model,
  ) : super(model);

  /// Переход к политике конфиденциальности
  @override
  void onPrivacyPolicyTapped() {
    // TODO: отобразить пользователю политику конфиденциальности
  }

  /// Переход к согласию на обработку персональных данных
  @override
  void onPersonalDataProcessingTapped() {
    // TODO: отобразить пользователю согласие на обработку персональных данных
  }

  /// Переход к пользовательскому соглашению
  @override
  void onUserAgreementTapped() {
    // TODO: отобразить пользователю пользовательское соглашению
  }

  /// Переход к правилам продажи товаров
  @override
  void onSellingRulesTapped() {
    // TODO: отобразить пользователю правила продажи товаров
  }

  /// Действие по нажатию назад
  @override
  void goBack() {
    Navigator.of(context).pop();
  }
}
