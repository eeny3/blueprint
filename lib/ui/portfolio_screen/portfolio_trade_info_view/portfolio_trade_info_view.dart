import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_account_view/portfolio_accounts_view.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_trade_info_view/portfolio_trade_info_view_wm.dart';

/// Страница информации о торговле
class PortfolioTradeInfoView
    extends ElementaryWidget<IPortfolioTradeInfoViewWidgetModel> {
  const PortfolioTradeInfoView({
    Key? key,
    WidgetModelFactory wmFactory =
        defaultPortfolioInvestInfoViewWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPortfolioTradeInfoViewWidgetModel wm) {
    return Container(
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
