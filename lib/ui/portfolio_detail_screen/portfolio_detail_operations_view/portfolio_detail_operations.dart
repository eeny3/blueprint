import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_operations_view/income/portfolio_detail_operations_income_view.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_operations_view/withdraw/portfolio_detail_deals_closed_view.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';
import 'package:one_trade/ui/widgets/tab/tab_bar.dart';

/// Страница подробностей о операциях портфолио
class AccountDetailsOperations extends StatefulWidget {
  const AccountDetailsOperations({
    Key? key,
  }) : super(key: key);

  @override
  State<AccountDetailsOperations> createState() =>
      _AccountDetailsOperationsState();
}

class _AccountDetailsOperationsState extends State<AccountDetailsOperations> {
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
              ? AccountDetailsOperationsViewIncome()
              : AccountDetailsOperationsViewWithdraw(),
        )
      ],
    );
  }
}
