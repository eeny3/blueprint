import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/shadows.dart';
import 'package:one_trade/resources/text_styles.dart';

/// Карточка операции пользователя
class DealCard extends StatelessWidget {
  const DealCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      padding: EdgeInsets.only(
        left: 16.w,
        right: 10.w,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: whiteColor,
          boxShadow: [defaultShadow]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: SvgPicture.asset(
              icDealOpened,
              width: 18.r,
              height: 18.r,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'OTC.THRS',
                style: textBold600Size14Grey2,
              ),
              SizedBox(height: 6.h),
              Text(
                '01/03/2022 12:56 PM',
                style: textPrimary500Size12BlueGrey,
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    text: '\$ 100',
                    style: textPrimary600Size18Primary,
                    children: [
                      TextSpan(
                        text: '.00',
                        style: textPrimary600Size18PrimaryAccent,
                      )
                    ]),
              ),
              SizedBox(height: 2.5.h),
              RichText(
                text: TextSpan(
                    text: '15',
                    style: textPrimary500Size12BlueGrey,
                    children: [
                      TextSpan(
                        text: '.00 USD',
                        style: textPrimary500Size12BlueGrey,
                      ),
                      TextSpan(
                          text: '/ 25',
                          style: textPrimary500Size12BlueGrey,
                          children: [
                            TextSpan(
                              text: '.00%',
                              style: textPrimary500Size12BlueGrey,
                            ),
                          ]),
                    ]),
              ),
            ],
          ),
          SizedBox(width: 10.w),
          Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor,
            ),
            child: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: whiteColor,
            ),
          )
        ],
      ),
    );
  }
}
