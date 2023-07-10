import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/shadows.dart';
import 'package:one_trade/resources/text_styles.dart';

/// Карточка Ipo
class InvestFundCard extends StatelessWidget {
  const InvestFundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 24.h),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: whiteColor,
        boxShadow: [
          defaultShadow
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Text(
                  'Мерос Фонд США',
                  style: textBold700Size20GreyAccent,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: Text(
                  '2 372 385.00 USD',
                  style: textBold500Size14GreyAccent,
                ),
              ),
              Text(
                '+ 13.47%',
                style: textPrimary500Size14Success,
              ),
            ],
          ),
          Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor,
            ),
            child: Icon(
              Icons.chevron_right_rounded,
              color: whiteColor,
            ),
          )
        ],
      ),
    );
  }
}
