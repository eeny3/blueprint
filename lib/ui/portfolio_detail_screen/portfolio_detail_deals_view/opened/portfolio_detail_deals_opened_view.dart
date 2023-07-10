import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/domain/order_domain.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_deals_view/opened/portfolio_detail_deals_opened_wm.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_deals_view/widgets/deal_card.dart';

/// Страница информации открытых сделок пользователя
class PortfolioDetailDealsViewOpened
    extends ElementaryWidget<IPortfolioDetailDealsViewOpenedWidgetModel> {
  PortfolioDetailDealsViewOpened( {
    Key? key,
    WidgetModelFactory? wmFactory,
    required int login,
  }) : super(
          wmFactory ??
              (context) =>
                  defaultPortfolioDetailDealsViewOpenedWidgetModelFactory(
                    context,
                    login: login,
                  ),
          key: key,
        );

  @override
  Widget build(IPortfolioDetailDealsViewOpenedWidgetModel wm) {
    return EntityStateNotifierBuilder<List<OrderDomain>>(
        listenableEntityState: wm.openedOrderList,
        builder: (BuildContext context, List<OrderDomain>? orders) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            children: [
              ...?orders?.map((e) => Padding(
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
