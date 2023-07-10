import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/domain/account_domain.dart';
import 'package:one_trade/domain/account_domain.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_account_view/portfolio_info_view_wm.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_all_accounts/portfolio_all_accounts_screen.dart';
import 'package:one_trade/ui/portfolio_screen/widgets/account_card_view.dart';
import 'package:one_trade/ui/portfolio_screen/widgets/new_account_card_view.dart';
import 'package:one_trade/ui/widgets/buttons/default_button.dart';

import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Страница информации всех счетов пользователя
class PortfolioAccountsView
    extends ElementaryWidget<IPortfolioAccountsViewWidgetModel> {
  const PortfolioAccountsView({
    Key? key,
    WidgetModelFactory wmFactory = defaultAppWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPortfolioAccountsViewWidgetModel wm) {
    return EntityStateNotifierBuilder<List<AccountDomain>>(
      listenableEntityState: wm.brokerList,
      loadingBuilder: (context, List<AccountDomain>? brokerList) => Center(
        child: CircularProgressIndicator(),
      ),
      builder: (BuildContext context, List<AccountDomain>? brokerList) {
        if ((brokerList ?? []).isEmpty) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.r)),
                  color: whiteColor,
                ),
                child: Column(
                  children: [
                    TextLocale(
                      'open_first_account_welcome',
                      style: textPrimary600Size18Black,
                    ),
                    Text(
                      'MEROS',
                      style: textPrimary600Size18Primary,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    PrimaryButton(
                      // onPressed: wm.toggle,
                      text: 'open',
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10.h, left: 16.w, right: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextLocale(
                      'accounts',
                      style: textBold700Size16Black,
                    ),
                    InkWell(
                      onTap: wm.selectAccount,
                      child: TextLocale(
                        'all',
                        style: textPrimary500Size12Primary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 160.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 16.w),
                    Padding(
                      padding:
                          EdgeInsets.only(right: 10.w).copyWith(bottom: 10.h),
                      child: NewAccountCardView(),
                    ),
                    ...?brokerList?.map(
                      (e) => Padding(
                        padding:
                            EdgeInsets.only(right: 10.w).copyWith(bottom: 10.h),
                        child: AccountCardView(
                          item: e,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
