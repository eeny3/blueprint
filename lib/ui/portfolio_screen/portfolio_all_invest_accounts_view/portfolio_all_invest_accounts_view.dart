import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/domain/account_domain.dart';
import 'package:one_trade/interactors/locale/locale_interactor.dart';
import 'package:one_trade/models/account/account_response_model.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/shadows.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_all_invest_accounts_view/portfolio_all_invest_accounts_view_wm.dart';

import 'package:one_trade/ui/widgets/form/primary_text_field.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Cтраница всех счетов инвестиции пользователя
class PortfolioAllInvestAccountsView
    extends ElementaryWidget<IPortfolioAllInvestAccountsViewWidgetModel> {
  const PortfolioAllInvestAccountsView({
    Key? key,
    WidgetModelFactory wmFactory = defaultAppWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPortfolioAllInvestAccountsViewWidgetModel wm) {
    return EntityStateNotifierBuilder<List<AccountDomain>>(
        listenableEntityState: wm.investListState,
        builder: (BuildContext context, List<AccountDomain>? investList) {
          if ((investList ?? []).isEmpty) {
            return SizedBox();
          }
          return Column(
            children: [
              StateNotifierBuilder<String?>(
                  listenableState: wm.queryState,
                  builder: (BuildContext context, String? query) {
                    return PrimaryTextField(
                      value: query,
                      hintText: getLocaleString('search'),
                      height: 35.h,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 20.w),
                      ),
                      onChange: wm.onSearchChanged,
                    );
                  }),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                children: [
                  ...?investList?.map((e) => Container(
                        width: 190.w,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 5.w),
                                        child: SvgPicture.asset(icPaper),
                                      ),
                                      SizedBox(
                                        width: 76.w,
                                        child: Text(
                                          '${e.login}',
                                          style: textPrimary600Size14GreyBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2.h, horizontal: 8.w),
                                    decoration: BoxDecoration(
                                      color: blueAccent,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.r)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 6.h),
                                        child: TextLocale(
                                          e.name,
                                          style: textPrimary700Size20,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 7.h),
                                        child: Text(
                                          '${e.balance} USD',
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
                                    color: primaryColor,
                                  ),
                                  child: Icon(
                                    Icons.chevron_right_rounded,
                                    color: whiteColor,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              '+ ${e.yieldPercent}% • ${e.closedProfit} USD',
                              style: textPrimary500Size10Success,
                            ),
                          ],
                        ),
                      ))
                ],
              ))
            ],
          );
        });
  }
}
