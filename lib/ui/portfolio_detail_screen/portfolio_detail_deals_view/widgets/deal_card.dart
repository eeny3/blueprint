import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/domain/order_domain.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/shadows.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_deals_view/deal_detail_screen.dart';

/// Карточка сделки
class DealCard extends StatelessWidget {
  const DealCard({Key? key, required this.item}) : super(key: key);

  final OrderDomain item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 10.w,
        top: 18.h,
        bottom: 18.5.h,
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
                item.symbol ?? '',
                style: textBold600Size14Grey2,
              ),
              SizedBox(height: 6.h),
              Text(
                item.openTimeFormatted,
                style: textPrimary500Size12BlueGrey,
              ),
            ],
          ),
          // Spacer(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                      text: '\$ ${item.priceRounded}',
                      style: textPrimary600Size18Primary,
                      children: [
                        TextSpan(
                          text: '.${item.priceRemainder}',
                          style: textPrimary600Size18PrimaryAccent,
                        )
                      ]),
                ),
                SizedBox(height: 2.5.h),
                RichText(
                  text: TextSpan(
                      text: '${item.increaseRounded ?? 0}',
                      style: textPrimary500Size12BlueGrey,
                      children: [
                        TextSpan(
                          text: '.${item.increaseRemainder} USD',
                          style: textPrimary500Size12BlueGreyAccent,
                        ),
                        TextSpan(
                            text: ' / ',
                            style: textPrimary500Size12BlueGrey,
                            children: [
                              TextSpan(
                                text: item.increasePercentRounded,
                                style: textPrimary500Size12BlueGrey,
                              ),
                              TextSpan(
                                text: '.${item.increasePercentRemainder}%',
                                style: textPrimary500Size12BlueGreyAccent,
                              ),
                            ]),
                      ]),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          InkWell(
            onTap: () => Navigator.push(
              context,
              DealDetailScreenRoute(item),
            ),
            child: Container(
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
            ),
          )
        ],
      ),
    );
  }
}
