import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/domain/account_domain.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_panel_view.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_screen_wm.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Страница подробностей о портфолио
class PortfolioDetailScreen
    extends ElementaryWidget<IPortfolioDetailScreenWidgetModel> {
  PortfolioDetailScreen({
    Key? key,
    required this.account,
  }) : super(
            (context) => defaultPortfolioDetailScreenWidgetModelFactory(
                context, account),
            key: key);
  final AccountDomain account;

  @override
  Widget build(IPortfolioDetailScreenWidgetModel wm) {
    return Scaffold(
      backgroundColor: blueAccent,
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: 14.h),
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  title: Text(
                    account.name,
                    style: textBold700Size26Black,
                  ),
                  leading: InkWell(
                    onTap: wm.pop,
                    child: Icon(
                      Icons.chevron_left_rounded,
                      color: primaryColor,
                      size: 40.r,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 4.h,
                      horizontal: 12.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: greyBlueColor,
                    ),
                    child: Text(
                      account.type ?? '',
                      style: textPrimary600Size14White,
                    ),
                  ),
                ),
                SizedBox(height: 7.h),
                Center(
                  child: TextLocale(
                    'account_login',
                    namedArgs: {'login': account.login.toString()},
                    style: textPrimary500Size14BlueGrey,
                  ),
                ),
                SizedBox(height: 5.h),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: '\$ ${account.balanceRounded}',
                      style: textPrimary700Size36Black,
                      children: [
                        TextSpan(
                          text: '.${account.balanceRemainder}',
                          style: textPrimary700Size36BlueGrey,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: wm.navigateExchangeScreen,
                      child: Container(
                        width: 75.w,
                        height: 75.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.5.r),
                          color: whiteColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 6.25.h),
                              child: SvgPicture.asset(
                                icAddCircle,
                                width: 25.r,
                                height: 25.r,
                              ),
                            ),
                            TextLocale(
                              'top_up',
                              style: textBold600Size12Grey2,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    InkWell(
                      onTap: wm.showWithdrawTypeSelectBottomSheet,
                      child: Container(
                        width: 75.w,
                        height: 75.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.5.r),
                          color: whiteColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 6.25.h),
                              child: SvgPicture.asset(
                                icExport,
                                width: 25.r,
                                height: 25.r,
                              ),
                            ),
                            TextLocale(
                              'withdraw',
                              style: textBold600Size12Grey2,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    InkWell(
                      onTap: wm.navigateExchangeScreen,
                      child: Container(
                        width: 75.w,
                        height: 75.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.5.r),
                          color: whiteColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 6.25.h),
                              child: SvgPicture.asset(
                                icExchange,
                                width: 25.r,
                                height: 25.r,
                              ),
                            ),
                            TextLocale(
                              'exchange',
                              style: textBold600Size12Grey2,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 39.h),
            Expanded(
              child: PortfolioDetailPanelView(
                login: account.login!,
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// Навигация к странице [PortfolioDetailScreen]
class PortfolioDetailScreenRoute extends MaterialPageRoute {
  PortfolioDetailScreenRoute(AccountDomain account)
      : super(
          builder: (context) => PortfolioDetailScreen(
            account: account,
          ),
        );
}
