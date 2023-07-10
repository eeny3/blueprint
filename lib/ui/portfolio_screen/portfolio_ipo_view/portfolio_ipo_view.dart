import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/domain/stock_domain.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_ipo_view/portfolio_ipo_wm.dart';
import 'package:one_trade/ui/portfolio_screen/widgets/actual_share_trade_card.dart';
import 'package:one_trade/ui/portfolio_screen/widgets/share_card.dart';
import 'package:one_trade/ui/widgets/buttons/tab_button.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Страница ipo
class PortfolioIpoView extends ElementaryWidget<IPortfolioIpoViewWidgetModel> {
  const PortfolioIpoView({
    Key? key,
    WidgetModelFactory wmFactory = defaultPortfolioIpoViewWidgetModelFactory,
    required this.controller,
    required this.switchPageTo,
    required this.currentTab,
  }) : super(wmFactory, key: key);

  final ScrollController controller;
  final Function(int) switchPageTo;
  final int currentTab;

  @override
  Widget build(IPortfolioIpoViewWidgetModel wm) {
    return ListView(
      controller: controller,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 40.h),
          child: Container(
            height: 40.h,
            child: Row(
              // scrollDirection: Axis.horizontal,
              children: [
                TabButton(
                  onClick: () => switchPageTo(0),
                  isActive: currentTab == 0,
                  label: 'IPO',
                ),
                TabButton(
                  onClick: () => switchPageTo(1),
                  isActive: currentTab == 1,
                  label: 'Pre-IPO (OTC)',
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: TextLocale(
            'actual_share_sales',
            style: textBold700Size18Grey2,
          ),
        ),
        ActualShareTradeView(),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: TextLocale(
            'past_share_sales',
            style: textBold700Size18Grey2,
          ),
        ),
        LayoutBuilder(builder: (context, constraints) {
          final size = (constraints.maxWidth - 20) / 2;
          return EntityStateNotifierBuilder<List<StockDomain>>(
              listenableEntityState: wm.ipoListState,
              loadingBuilder: (_, __) =>
                  Center(child: const CircularProgressIndicator()),
              builder: (BuildContext context, ipoList) {
                return Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    ...?ipoList?.map(
                      (e) => SizedBox(
                        width: size,
                        height: size,
                        child: ShareCard(
                          item: e,
                        ),
                      ),
                    )
                  ],
                );
              });
        }),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }
}
