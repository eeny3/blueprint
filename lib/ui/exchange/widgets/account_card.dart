import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/shadows.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Карточка счета пользователя
class AccountCard extends StatelessWidget {
  const AccountCard({
    Key? key,
    this.isSelected = false,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(25.r)),
        boxShadow: [defaultShadow],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 15.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: SvgPicture.asset(
                        icPaper,
                        width: 13.w,
                        height: 15.3.h,
                      ),
                    ),
                    SizedBox(
                      width: 76.w,
                      child: Text(
                        '823256',
                        style: textPrimary600Size14GreyBlue,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                  child: Center(
                    child: TextLocale(
                      'trade',
                      style: textPrimary600Size10GreyBlue,
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 6.h),
                      child: TextLocale(
                        'account_name',
                        style: textPrimary700Size20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 7.h),
                      child: Text(
                        '2 372 385.00 USD',
                        style: textPrimary500Size14GreyAccent,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 30.h,
                width: 30.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? primaryColor : null,
                  border: isSelected
                      ? null
                      : Border.all(
                          width: 3.w,
                          color: primaryColor.withOpacity(0.5),
                        ),
                ),
                child: isSelected
                    ? Icon(
                        Icons.check,
                        color: whiteColor,
                      )
                    : null,
              )
            ],
          ),
          Text(
            '+ 46.25% • 500.34 USD',
            style: textPrimary500Size10Success,
          ),
        ],
      ),
    );
  }
}
