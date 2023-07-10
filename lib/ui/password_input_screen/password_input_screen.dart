import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/interactors/locale/locale_interactor.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/ui/password_input_screen/password_input_screen_wm.dart';
import 'package:one_trade/ui/password_input_screen/widgets/password_input_screen_button.dart';
import 'package:one_trade/ui/password_input_screen/widgets/password_input_screen_header.dart';
import 'package:one_trade/ui/password_input_screen/widgets/password_input_screen_textfield.dart';

/// Страрница ввода пароля
class PasswordInputScreen extends ElementaryWidget<PasswordInputScreenWM> {
  /// Номер телефона
  final String phone;

  /// Номер телефона
  final String password;

  /// id юзера
  final String id;

  const PasswordInputScreen(this.phone, this.id, this.password, {Key? key})
      : super(createPasswordInputScreensWM, key: key);

  @override
  Widget build(PasswordInputScreenWM wm) {
    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: false,
      body: EntityStateNotifierBuilder(
          listenableEntityState: wm.registrationThirdStepState,
          loadingBuilder: (_, __) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          },
          builder: (_, __) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    const PasswordInputScreenHeader(
                      headerTitle: 'confirm_password',
                    ),
                    const Spacer(),
                    PasswordTextField(
                      controller: wm.controller,
                      inputColor: lightGrey,
                      onChanged: wm.onTextFieldChanged,
                    ),
                    const Spacer(),
                    const Spacer(),
                    StateNotifierBuilder(
                        listenableState: wm.buttonState,
                        builder: (_, bool? isButtonActive) {
                          return CustomButton(
                            title: getLocaleString('continue'),
                            onTap: () {
                              wm.onButtonPressed(id, phone, password);
                            },
                            isActive: isButtonActive ?? true,
                          );
                        }),
                    SizedBox(height: 34.h),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
