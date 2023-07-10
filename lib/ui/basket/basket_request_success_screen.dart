import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/styles.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/buttons/default_button.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Страница успешной отправки заявки на покупку
class BasketRequestSuccessScreen extends StatelessWidget {
  const BasketRequestSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment(1, 0),
                child: GestureDetector(
                  onTap: () => Navigator.popUntil(
                    context,
                    (route) => route.settings.name == '/',
                  ),
                  child: SvgPicture.asset(
                    icClose,
                    width: 26.r,
                    height: 26.r,
                  ),
                ),
              ),
              Expanded(
                child: SvgPicture.asset(
                  icCheckCircleLarge,
                  height: 200.h,
                  width: 200.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: TextLocale(
                  'request_sent',
                  style: textPrimary600Size30GreyAccent,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 73.h),
                child: TextLocale(
                  'request_sent_pre_ipo_sent',
                  style: textPrimary500Size18BlueGrey,
                  namedArgs: {
                    'number': '1234',
                  },
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 17).copyWith(bottom: 60.h),
                child: PrimaryButton(
                  onPressed: () {},
                  text: 'close',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
