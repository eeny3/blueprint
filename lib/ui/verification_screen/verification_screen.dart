import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/ui/phone_input_screen/widgets/numpad.dart';
import 'package:one_trade/ui/verification_screen/states/code_data.dart';
import 'package:one_trade/ui/verification_screen/verification_screen_wm.dart';
import 'package:one_trade/ui/verification_screen/widgets/code_input.dart';
import 'package:one_trade/ui/verification_screen/widgets/verification_screen_footer.dart';
import 'package:one_trade/ui/verification_screen/widgets/verification_screen_header.dart';

/// Страрница ввода кода
class VerificationScreen extends ElementaryWidget<VerificationScreenWM> {
  /// id юзера
  final String id;

  /// номер телефона юзера
  final String phone;

  const VerificationScreen(this.id, this.phone, {Key? key})
      : super(createVerificationScreensWM, key: key);

  @override
  Widget build(VerificationScreenWM wm) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: wm.popScreen,
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: primaryColor,
          ),
        ),
      ),
      backgroundColor: whiteColor,
      body: EntityStateNotifierBuilder<void>(
          listenableEntityState: wm.registrationSecondStepState,
          loadingBuilder: (_, __) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          },
          builder: (_, data) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    VerificationScreenHeader(
                      phoneNumber: phone,
                    ),
                    const Spacer(),
                    StateNotifierBuilder(
                      listenableState: wm.codeState,
                      builder: (_, VerificationCodeData? code) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          child: CodeInput(
                            code: code?.code ?? '',
                            isCorrectInput: code?.isCorrect ?? true,
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    NumericKeyboard(
                      onKeyboardTap: (String value) {
                        wm.onNumberTapped(value, id, phone);
                      },
                      textColor: Colors.black,
                      rightButtonFn: wm.onBackspaceTapped,
                      rightIcon: SizedBox(
                        width: 30.w,
                        height: 20.h,
                        child: SvgPicture.asset(icBackspace),
                      ),
                      leftButtonFn: null,
                      leftIcon: SizedBox(
                        width: 40.w,
                        height: 40.w,
                      ),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    StateNotifierBuilder(
                        listenableState: wm.countdownState,
                        builder: (_, int? countdown) {
                          return GestureDetector(
                            onTap: () {
                              wm.isCanResendCode ? wm.requestCode(phone) : null;
                            },
                            child: VerificationScreenFooter(
                              countdown: countdown ?? 0,
                            ),
                          );
                        }),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
