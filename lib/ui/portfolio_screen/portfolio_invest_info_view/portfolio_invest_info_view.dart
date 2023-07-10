import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_account_view/portfolio_accounts_view.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_invest_info_view/portfolio_invest_info_view_wm.dart';

/// Страница инвестиции
class PortfolioInvestInfoView
    extends ElementaryWidget<IPortfolioInvestInfoViewWidgetModel> {
  const PortfolioInvestInfoView({
    Key? key,
    WidgetModelFactory wmFactory =
        defaultPortfolioInvestInfoViewWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPortfolioInvestInfoViewWidgetModel wm) {
    return  Container(
      height: 0.5.sh,
      child: Column(
        children: [
          SizedBox(height: 35.h),
          Expanded(child: PortfolioAccountsView()),
          SizedBox(height: 35.h),
        ],
      ),
    );
  }
}
