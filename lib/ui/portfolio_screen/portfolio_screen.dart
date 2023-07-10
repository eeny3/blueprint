import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/shadows.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/ui/basket/basket_screen.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_invest_info_view/portfolio_invest_info_view.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_trade_info_view/portfolio_trade_info_view.dart';
import 'package:one_trade/ui/portfolio_screen/widgets/portfolio_invest_panel_view.dart';
import 'package:one_trade/ui/portfolio_screen/widgets/portfolio_trade_panel_view.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';
import 'package:one_trade/ui/widgets/tab/tab_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

/// Страница портфолио пользователя
class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

/// Страница портфолио пользователя
class _PortfolioScreenState extends State<PortfolioScreen>
    with SingleTickerProviderStateMixin {
  int _currentTab = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(listener);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = ScreenUtil().statusBarHeight;
    final panelMaxHeight = 0.85.sh - 80.h - statusBarHeight;
    final panelMinHeight = 0.5.sh - 80.h - statusBarHeight;
    return Scaffold(
      backgroundColor: blueAccent,
      body: Stack(
        children: [
          SafeArea(
            child: SlidingUpPanel(
              maxHeight: panelMaxHeight,
              minHeight: panelMinHeight,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
              backdropEnabled: true,
              body: Column(
                children: [
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        Container(
                          width: 35.w,
                          height: 35.h,
                          margin: EdgeInsets.only(right: 10.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                          child: Center(
                            child: Text(
                              'И',
                              style: textBold800Size18White,
                            ),
                          ),
                        ),
                        Text(
                          'Иван',
                          style: textBold800Size26Black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: PrimaryTabBar(
                      currentTab: _currentTab,
                      labels: [
                        'trading',
                        'investments',
                      ],
                      backgroundColor: whiteColor,
                      onTabChanged: (value) {
                        setState(() {
                          _currentTab = value;
                        });
                      },
                    ),
                  ),
                  _currentTab == 0
                      ? PortfolioTradeInfoView()
                      : PortfolioInvestInfoView()
                ],
              ),
              panelBuilder: (controller) => _currentTab == 0
                  ? PortfolioTradePanelView(
                      controller: controller,
                    )
                  : PortfolioInvestPanelView(
                      controller: controller,
                    ),
            ),
          ),
          Positioned(
            bottom: 20.h,
            right: 15.w,
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                BasketScreenRoute(),
              ),
              child: Container(
                width: 60.r,
                height: 60.r,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                    boxShadow: [primaryShadow]),
                child: Center(
                    child: Stack(
                  children: [
                    SvgPicture.asset(
                      icCart,
                      width: 34.r,
                      height: 34.r,
                    ),
                    Positioned(
                      bottom: 0,
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          '2',
                          style: textBold600Size10White,
                        ),
                      ),
                    )
                  ],
                )),
              ),
            ),
          )
        ],
      ),
    );
  }

  void listener() {
    setState(() {
      _currentTab = _tabController.index;
    });
  }
}
