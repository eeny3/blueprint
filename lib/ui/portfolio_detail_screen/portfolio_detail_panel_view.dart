import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_account_detail_view/portfolio_detail_account_details.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_deals_view/portfolio_detail_deals.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_operations_view/portfolio_detail_operations.dart';
import 'package:one_trade/ui/widgets/buttons/tab_button.dart';

/// Выдвигающая Панель подробностей о портфолио
class PortfolioDetailPanelView extends StatefulWidget {
  const PortfolioDetailPanelView({
    Key? key,
    required this.login,
  }) : super(key: key);

  final int login;

  @override
  State<PortfolioDetailPanelView> createState() =>
      _PortfolioDetailPanelViewState();
}

class _PortfolioDetailPanelViewState extends State<PortfolioDetailPanelView> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
        color: whiteColor,
      ),
      child: Column(
        children: [
          SizedBox(height: 30.h),
          SizedBox(
            height: 40.h,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              scrollDirection: Axis.horizontal,
              children: [
                TabButton(
                  onClick: () => setState(() => currentTab = 0),
                  isActive: currentTab == 0,
                  label: 'deals',
                ),
                TabButton(
                  onClick: () => setState(() => currentTab = 1),
                  isActive: currentTab == 1,
                  label: 'account_detail',
                ),
                TabButton(
                  onClick: () => setState(() => currentTab = 2),
                  isActive: currentTab == 2,
                  label: 'operations',
                ),
                TabButton(
                  onClick: () => setState(() => currentTab = 3),
                  isActive: currentTab == 3,
                  label: 'portfolio',
                ),
                TabButton(
                  onClick: () => setState(() => currentTab = 4),
                  isActive: currentTab == 4,
                  label: 'requests',
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Divider(
            thickness: 10.h,
            color: Color(0xFFF6F7FB),
          ),
          if (currentTab == 0)
            Expanded(
              child: PortfolioDetailDeals(
                login: widget.login,
              ),
            ),
          if (currentTab == 1)
            Expanded(
              child: PortfolioDetailAccountDetails(),
            ),
          if (currentTab == 2)
            Expanded(
              child: AccountDetailsOperations(),
            ),
        ],
      ),
    );
  }
}
