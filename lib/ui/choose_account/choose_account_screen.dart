import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/basket/exchange_trading_view/exchange_trading_view.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Страница выбора счета пользователя
class ChooseAccountScreen extends StatelessWidget {
  const ChooseAccountScreen({Key? key}) : super(key: key);

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
            SizedBox(height: 20.h),
            Expanded(
              child: ExchangeTradingView(),
            ),
          ],
        ),
      ),
    );
  }
}

/// Навигация к странице [ChooseAccountScreen]
class ChooseAccountScreenRoute extends MaterialPageRoute {
  ChooseAccountScreenRoute()
      : super(
    builder: (context) => const ChooseAccountScreen(),
  );
}