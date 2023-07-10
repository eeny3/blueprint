import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/interactors/locale/locale_interactor.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/shadows.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';
import 'package:one_trade/ui/withdraw/withdraw_sum_view.dart';

/// Карточка типа платежа для вывода средств
class WithdrawTypeCard extends StatelessWidget {
  const WithdrawTypeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 41.h, horizontal: 18.w)
          .copyWith(bottom: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: whiteColor,
        boxShadow: [defaultShadow],
        border: Border.all(
          width: 2.w,
          color: grey,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextLocale(
            'crypto_wallet',
            style: textBold700Size24Black,
          ),
          SizedBox(height: 5.h),
          RichText(
            text: TextSpan(
                text: getLocaleString('enrollment_term'),
                style: textPrimary600Size14Grey3,
                children: [
                  TextSpan(
                    text: getLocaleString('enrollment_term_hours'),
                    style: textBold600Size14GreyAccent,
                  )
                ]),
          ),
          RichText(
            text: TextSpan(
                text: getLocaleString('commission'),
                style: textPrimary600Size14Grey3,
                children: [
                  TextSpan(
                    text: '0,5%',
                    style: textPrimary600Size14Success,
                  )
                ]),
          ),
          SizedBox(height: 14.h),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isDismissible: true,
                isScrollControlled: true,
                context: context,
                builder: (context) => WithdrawSumView(),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextLocale(
                  'top_up',
                  style: textPrimary400Size10GreyBlue,
                ),
                SvgPicture.asset(
                  icArrowRight,
                  width: 3.w,
                  height: 6.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
