import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/exchange/exchange_invest_view/exchange_invest_view.dart';
import 'package:one_trade/ui/exchange/exchange_trading_view/exchange_trading_view.dart';
import 'package:one_trade/ui/widgets/form/primary_text_field.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';
import 'package:one_trade/ui/widgets/tab/tab_bar.dart';

/// Страница перевода средств пользователя
class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen>
    with SingleTickerProviderStateMixin {
  int _currentTab = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(listener);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.chevron_left_rounded,
            color: primaryColor,
            size: 40.r,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: TextLocale(
                  'choose_exchange_account',
                  style: textBold800Size26Black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: PrimaryTabBar(
                currentTab: _currentTab,
                labels: [
                  'trading',
                  'investments',
                ],
                onTabChanged: (value) {
                  _tabController.animateTo(value,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.bounceIn);
                },
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: _currentTab == 0
                  ? ExchangeTradingView()
                  : ExchangeInvestView(),
            ),
          ],
        ),
      ),
    );
  }

  void listener() {
    setState(() {
      _currentTab = _tabController.index;
    });
  }
}

/// Навигация к странице [ExchangeScreen]
class ExchangeScreenRoute extends MaterialPageRoute {
  ExchangeScreenRoute()
      : super(
          builder: (context) => const ExchangeScreen(),
        );
}
