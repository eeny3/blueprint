import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/domain/account_domain.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/shadows.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_screen.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Карточка счета пользователя
class AccountCardView extends StatelessWidget {
  const AccountCardView({Key? key, required this.item}) : super(key: key);

  final AccountDomain item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 190.w,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(25.r)),
        boxShadow: [defaultShadow],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Row(
              children: [
                Expanded(
                  child: Row(
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
                      Expanded(
                        child: Text(
                          '${item.login ?? 'account_name'}',
                          style: textPrimary600Size14GreyBlue,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                  child: Center(
                    child: TextLocale(
                      item.type ?? 'trade',
                      style: textPrimary600Size10GreyBlue,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: TextLocale(
              item.name,
              style: textPrimary700Size16,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              '${item.balance} USD',
              style: textPrimary500Size14GreyAccent,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(PortfolioDetailScreenRoute(item));
            },
            child: Row(
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
            ),
          )
        ],
      ),
    );
  }
}
