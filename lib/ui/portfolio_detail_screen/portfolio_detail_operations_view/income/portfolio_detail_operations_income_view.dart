import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/domain/order_domain.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_deals_view/widgets/deal_card.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_operations_view/income/portfolio_detail_deals_opened_wm.dart';

/// Страница информации операции пополнений пользователя
class AccountDetailsOperationsViewIncome
    extends ElementaryWidget<IAccountDetailsOperationsViewIncomeWidgetModel> {
  const AccountDetailsOperationsViewIncome({
    Key? key,
    WidgetModelFactory wmFactory =
        defaultAccountDetailsOperationsViewIncomeWidgetModelFactory,
  }) : super(
          wmFactory,
          key: key,
        );

  @override
  Widget build(IAccountDetailsOperationsViewIncomeWidgetModel wm) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      children: [
        // TODO данные с бэка
        ...[1, 2, 3, 4].map((e) => Padding(
          padding: EdgeInsets.only(bottom: 11.h),
          child: DealCard(
            item: OrderDomain(),
          ),
        )),
      ],
    );
  }
}
