import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_deals_view/closed/portfolio_detail_deals_closed_view.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_deals_view/opened/portfolio_detail_deals_opened_view.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';
import 'package:one_trade/ui/widgets/tab/tab_bar.dart';

/// Страница сделок пользователя
class PortfolioDetailDeals extends StatefulWidget {
  const PortfolioDetailDeals({
    Key? key,
    required this.login,
  }) : super(key: key);

  final int login;

  @override
  State<PortfolioDetailDeals> createState() => _PortfolioDetailDealsState();
}

class _PortfolioDetailDealsState extends State<PortfolioDetailDeals> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: PrimaryTabBar(
            currentTab: _currentTab,
            labels: [
              'income',
              'withdraw',
            ],
            onTabChanged: (value) {
              setState(() {
                _currentTab = value;
              });
            },
          ),
        ),
        SizedBox(height: 35.h),
        Expanded(
          child: _currentTab == 0
              ? PortfolioDetailDealsViewOpened(
                  login: widget.login,
                )
              : PortfolioDetailDealsViewClosed(
                  login: widget.login,
                ),
        )
      ],
    );
  }
}
