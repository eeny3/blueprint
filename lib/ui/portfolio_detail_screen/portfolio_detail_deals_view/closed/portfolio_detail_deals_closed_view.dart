import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/domain/order_domain.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_deals_view/closed/portfolio_detail_deals_closed_wm.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_deals_view/widgets/deal_card.dart';
import 'package:one_trade/ui/widgets/buttons/tab_button.dart';

/// Страница информации закрытых сделок пользователя
class PortfolioDetailDealsViewClosed
    extends ElementaryWidget<IPortfolioDetailDealsViewClosedWidgetModel> {
  PortfolioDetailDealsViewClosed({
    Key? key,
    WidgetModelFactory? wmFactory,
    required int login,
  }) : super(
          wmFactory ??
              (context) =>
                  defaultPortfolioDetailDealsViewClosedWidgetModelFactory(
                    context,
                    login: login,
                  ),
          key: key,
        );

  @override
  Widget build(IPortfolioDetailDealsViewClosedWidgetModel wm) {
    return EntityStateNotifierBuilder<List<OrderDomain>>(
        listenableEntityState: wm.closedOrderList,
        builder: (BuildContext context, List<OrderDomain>? closedOrders) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            children: [
              ...?closedOrders?.map((e) => Padding(
                    padding: EdgeInsets.only(bottom: 11.h),
                    child: DealCard(
                      item: e,
                    ),
                  )),
            ],
          );
        });
  }
}
