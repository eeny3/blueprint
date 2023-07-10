import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/domain/stock_domain.dart';
import 'package:one_trade/interactors/locale/locale_interactor.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/shadows.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_ipo_view/portfolio_ipo_view.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_pre_ipo_view/portfolio_pre_ipo_view.dart';
import 'package:one_trade/ui/portfolio_screen/widgets/actual_share_trade_card.dart';
import 'package:one_trade/ui/portfolio_screen/widgets/share_card.dart';
import 'package:one_trade/ui/pre_ipo_detail/pre_ipo_detail.dart';
import 'package:one_trade/ui/widgets/buttons/tab_button.dart';
import 'package:one_trade/ui/widgets/form/primary_text_field.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Нижняя панель портфолио с информацией продаж
class PortfolioTradePanelView extends StatefulWidget {
  const PortfolioTradePanelView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ScrollController controller;

  @override
  State<PortfolioTradePanelView> createState() =>
      _PortfolioTradePanelViewState();
}

class _PortfolioTradePanelViewState extends State<PortfolioTradePanelView>
    with SingleTickerProviderStateMixin {
  int index = 0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(listener);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void switchPageIndex(index) {
    tabController.animateTo(
      index,
      duration: Duration(milliseconds: 100),
      curve: Curves.bounceIn,
    );
    widget.controller.animateTo(
      widget.controller.offset + 100,
      duration: Duration(milliseconds: 1),
      curve: Curves.bounceIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.h,
                horizontal: 15.w,
              ).copyWith(bottom: 30.h),
              child: PrimaryTextField(
                value: '',
                hintText: getLocaleString('search'),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                ),
                onChange: (value) {},
              ),
            ),
          ],
        ),
        Expanded(
          child: index == 0
              ? PortfolioIpoView(
                  controller: widget.controller,
                  switchPageTo: switchPageIndex,
                  currentTab: index,
                )
              : PortfolioPreIpoView(
                  controller: widget.controller,
                  switchPageTo: switchPageIndex,
                  currentTab: index,
                ),
        ),
      ],
    );
  }

  void listener() {
    setState(() {
      index = tabController.index;
    });
  }
}

class IPOView extends StatelessWidget {
  const IPOView({
    Key? key,
    required this.controller,
    required this.switchPageTo,
    required this.currentTab,
  }) : super(key: key);

  final ScrollController controller;
  final Function(int) switchPageTo;
  final int currentTab;

  @override
  Widget build(BuildContext context) {
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
          return Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              // TODO temp data
              ...[1, 2, 3, 4, 5].asMap().entries.map(
                    (e) => SizedBox(
                      width: size,
                      height: size,
                      child: ShareCard(
                        item: StockDomain(),
                      ),
                    ),
                  )
            ],
          );
        }),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }
}

class PreIPOView extends StatelessWidget {
  const PreIPOView({
    Key? key,
    required this.controller,
    required this.switchPageTo,
    required this.currentTab,
  }) : super(key: key);

  final ScrollController controller;
  final Function(int) switchPageTo;
  final int currentTab;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 40.h),
          child: SizedBox(
            height: 40.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
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
        LayoutBuilder(
          builder: (context, constraints) {
            final size = (constraints.maxWidth - 20) / 2;
            return Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                // TODO temp data
                ...[1, 2, 3, 4, 5].asMap().entries.map(
                      (e) => SizedBox(
                        width: size,
                        height: size,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PreIpoDetailScreenRoute(StockDomain()),
                            );
                          },
                          child: ShareCard(
                            item: StockDomain(),
                          ),
                        ),
                      ),
                    )
              ],
            );
          },
        ),
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
          return Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              ...[1, 2, 3, 4, 5].asMap().entries.map((e) => Container(
                    width: size,
                    height: size,
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25.r)),
                      color: whiteColor,
                      boxShadow: [defaultShadow],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Image.asset(imgHaspiCorp),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Text(
                            'HashiCorp',
                            style: textPrimary700Size20,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: RichText(
                            text: TextSpan(
                              text: 'Дата IPO: ',
                              style: textPrimary500Size14Accent,
                              children: [
                                TextSpan(
                                  text: '06.07.21',
                                  style: textPrimary500Size14Black,
                                )
                              ],
                            ),
                          ),
                        ),
                        Text(
                          '+ 13.47%',
                          style: textPrimary500Size14Success,
                        ),
                      ],
                    ),
                  ))
            ],
          );
        })
      ],
    );
  }
}
