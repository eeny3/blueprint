import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/interactors/locale/locale_interactor.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/strings/common_strings.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/register_account/register_account_screen.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Карточка регистрации нового счета
class NewAccountCardView extends StatelessWidget {
  const NewAccountCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 150.h,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFA1A6AF),
            offset: Offset(0, 25),
            blurRadius: 17,
            spreadRadius: -40,
          ),
        ],
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: SvgPicture.asset(
                    icPaper,
                    width: 13.w,
                    height: 15.3.h,
                  ),
                ),
                Expanded(
                  child: TextLocale(
                    'new_account',
                    style: textPrimary600Size14GreyBlue,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: GestureDetector(
                onTap: () =>
                    Navigator.of(context).push(RegisterAccountScreenRoute()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 32.r,
                      width: 32.r,
                      margin: EdgeInsets.only(right: 5.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor,
                      ),
                      child: Center(
                          child: SvgPicture.asset(
                        icAdd,
                        width: 14.6.r,
                        height: 14.6.r,
                      )),
                    ),
                    TextLocale(
                      'open',
                      style: textPrimary600Size14GreyBlue,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: TextLocale(
                  'more',
                  style: textPrimary400Size10GreyBlue,
                ),
              ),
              SvgPicture.asset(
                icArrowRight,
                width: 8.w,
                height: 10.h,
              )
            ],
          )
        ],
      ),
    );
  }
}
