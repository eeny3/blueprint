import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/ui/phone_input_screen/phone_input_screen_wm.dart';
import 'package:one_trade/ui/phone_input_screen/widgets/numpad.dart';
import 'package:one_trade/ui/phone_input_screen/widgets/phone_input_screen_footer.dart';
import 'package:one_trade/ui/phone_input_screen/widgets/phone_input_screen_header.dart';
import 'package:one_trade/ui/phone_input_screen/widgets/phone_textfield.dart';
import 'package:one_trade/ui/widgets/layout/primary_scaffold.dart';

class PhoneInputScreen extends ElementaryWidget<PhoneInputScreenWM> {
  const PhoneInputScreen({Key? key})
      : super(createPhoneInputScreensWM, key: key);

  @override
  Widget build(PhoneInputScreenWM wm) {
    return PrimaryLayout.state(
      backgroundColor: whiteColor,
      screenState: wm.registrationFirstStepState,
      builder: (_, data) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                const PhoneInputScreenHeader(),
                const Spacer(),
                PhoneTextField(
                  controller: wm.controller,
                  inputColor: lightGrey,
                ),
                const Spacer(),
                NumericKeyboard(
                  onKeyboardTap: wm.onNumberTapped,
                  textColor: Colors.black,
                  rightButtonFn: wm.onBackspaceTapped,
                  rightIcon: SizedBox(
                    width: 30.w,
                    height: 20.h,
                    child: SvgPicture.asset(icBackspace),
                  ),
                  leftButtonFn: wm.onCheckTapped,
                  leftIcon: Container(
                    width: 40.w,
                    height: 40.w,
                    child: SvgPicture.asset(icCheck),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: grey6.withOpacity(0.3),
                          spreadRadius: 0,
                          blurRadius: 11,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                  ),
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                const PhoneInputScreenFooter(),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        );
      },
    );
  }
}