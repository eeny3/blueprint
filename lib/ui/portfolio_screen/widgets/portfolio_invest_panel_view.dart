import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/interactors/locale/locale_interactor.dart';
import 'package:one_trade/ui/portfolio_screen/widgets/invest_fund_card.dart';
import 'package:one_trade/ui/widgets/buttons/tab_button.dart';
import 'package:one_trade/ui/widgets/form/primary_text_field.dart';

/// Нижняя панель портфолио с информацией продаж
class PortfolioInvestPanelView extends StatefulWidget {
  const PortfolioInvestPanelView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ScrollController controller;

  @override
  State<PortfolioInvestPanelView> createState() =>
      _PortfolioInvestPanelViewState();
}

class _PortfolioInvestPanelViewState extends State<PortfolioInvestPanelView>
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
                height: 40.h,
                hintText: getLocaleString('search'),
                onChange: (value) {},
              ),
            ),
          ],
        ),
        Expanded(
          child: index == 0
              ? IPOView(
                  controller: widget.controller,
                  switchPageTo: switchPageIndex,
                  currentTab: index,
                )
              : PreIPOView(
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
          child: SizedBox(
            height: 40.h,
            child: Row(
              // scrollDirection: Axis.horizontal,
              children: [
                TabButton(
                  onClick: () => switchPageTo(0),
                  isActive: currentTab == 0,
                  label: 'Фонды США',
                ),
                TabButton(
                  onClick: () => switchPageTo(1),
                  isActive: currentTab == 1,
                  label: 'Фонды ОАЭ',
                ),
              ],
            ),
          ),
        ),
        ...[1, 2, 3, 4].map((e) => InvestFundCard()),
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
            child: Row(
              // scrollDirection: Axis.horizontal,
              children: [
                TabButton(
                  onClick: () => switchPageTo(0),
                  isActive: currentTab == 0,
                  label: 'Фонды США',
                ),
                TabButton(
                  onClick: () => switchPageTo(1),
                  isActive: currentTab == 1,
                  label: 'Фонды ОАЭ',
                ),
              ],
            ),
          ),
        ),
        ...[1, 2, 3, 4].map((e) => InvestFundCard()),
      ],
    );
  }
}
