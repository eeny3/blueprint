import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/domain/order_domain.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_deals_view/widgets/deal_card.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_operations_view/withdraw/portfolio_detail_deals_closed_wm.dart';

/// Страница информации операции вывода пользователя
class AccountDetailsOperationsViewWithdraw
    extends ElementaryWidget<IAccountDetailsOperationsViewWithdrawWidgetModel> {
  const AccountDetailsOperationsViewWithdraw({
    Key? key,
    WidgetModelFactory wmFactory =
        defaultAccountDetailsOperationsViewWithdrawWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IAccountDetailsOperationsViewWithdrawWidgetModel wm) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      children: [
        // TODO данные с бэка
        ...[1, 2, 3, 4, 5, 6, 6].map((e) => Padding(
          padding: EdgeInsets.only(bottom: 11.h),
          child: DealCard(
            item: OrderDomain(),
          ),
        )),
      ],
    );
  }
}
