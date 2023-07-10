import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/shadows.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_all_accounts/portfolio_all_accounts_screen_wm.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_all_trade_accounts_view/portfolio_all_trade_accounts_view.dart';
import 'package:one_trade/ui/widgets/tab/tab_bar.dart';
import 'package:one_trade/ui/widgets/tab/tab_bar_item.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Страница всех счетов пользователя
class PortfolioAllAccountsScreen
    extends ElementaryWidget<IPortfolioAllAccountsScreenWidgetModel> {
  const PortfolioAllAccountsScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultAppWidgetModelFactory,
  }) : super(wmFactory, key: key);

  Widget build(IPortfolioAllAccountsScreenWidgetModel wm) {
    return StateNotifierBuilder<int>(
        listenableState: wm.currentTabState,
        builder: (BuildContext context, int? currentTab) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: InkWell(
                onTap: wm.goBack,
                child: Icon(
                  Icons.chevron_left_rounded,
                  color: primaryColor,
                  size: 40.r,
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: TextLocale(
                      'all_accounts',
                      style: textBold800Size26Black,
                    ),
                  ),
                  PrimaryTabBar(
                    currentTab: currentTab,
                    labels: ['trading', 'investments'],
                    onTabChanged: wm.changeTab,
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: currentTab ?? 0,
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          PortfolioAllTradeAccountsView(),
                          PortfolioAllAccountsScreen(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}



/// Навигация к странице [PortfolioAllAccountsScreen]
class PortfolioAllAccountsScreenRoute extends MaterialPageRoute {
  PortfolioAllAccountsScreenRoute()
      : super(
    builder: (context) => const PortfolioAllAccountsScreen(),
  );
}
