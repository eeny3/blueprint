import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/auth_screen/auth_screen_wm.dart';
import 'package:one_trade/ui/auth_screen/widgets/custom_button.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

class AuthScreen extends ElementaryWidget<AuthScreenWM> {
  const AuthScreen({Key? key}) : super(createAuthScreensWM, key: key);

  @override
  Widget build(AuthScreenWM wm) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 33.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            TextLocale(
              'app_name',
              style: textBold700Size64White,
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 94.h),
              child: CustomButton(
                title: "authorize",
                onTap: wm.onAuthorizePressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
