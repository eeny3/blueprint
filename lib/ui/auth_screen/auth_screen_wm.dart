import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/ui/auth_screen/auth_screen.dart';
import 'package:one_trade/ui/auth_screen/auth_screen_model.dart';
import 'package:one_trade/ui/phone_input_screen/phone_input_screen.dart';
import 'package:one_trade/utils/navigation_helper.dart';

class AuthScreenWM extends WidgetModel<AuthScreen, AuthScreenModel> {
  final NavigationHelper _navigator;

  AuthScreenWM(AuthScreenModel model, this._navigator) : super(model);

  void onAuthorizePressed() {
    _navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => const PhoneInputScreen(),
      ),
    );
  }
}

AuthScreenWM createAuthScreensWM(BuildContext _) => AuthScreenWM(
      AuthScreenModel(),
      NavigationHelper(),
    );
