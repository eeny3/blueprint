import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_account_detail_view/closed/portfolio_detail_account_details_wm.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_account_detail_view/widgets/deal_card.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_deals_view/widgets/deal_card.dart';

/// Страница информации счета пользователя
class PortfolioDetailAccountDetailsView
    extends ElementaryWidget<IPortfolioDetailAccountDetailsViewWidgetModel> {
  const PortfolioDetailAccountDetailsView({
    Key? key,
    WidgetModelFactory wmFactory =
        defaultPortfolioDetailAccountDetailsViewWidgetModelFactory,
  }) : super(wmFactory, key: key,);


  @override
  Widget build(IPortfolioDetailAccountDetailsViewWidgetModel wm) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      children: [
        // TODO тестовые данные
        ...[
          {
            'label': 'Создан:',
          },
          {
            'label': 'Баланс:',
          },
        ].map((e) => Padding(
          padding: EdgeInsets.only(bottom: 11.h),
          child: AccountDetailsCard(
            label: e['label'] ?? '',
          ),
        )),
      ],
    );
  }
}
