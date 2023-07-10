import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/domain/basket_domain.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/basket/basket_screen_wm.dart';
import 'package:one_trade/ui/basket/widgets/basket_card.dart';
import 'package:one_trade/ui/choose_account/choose_account_screen.dart';
import 'package:one_trade/ui/widgets/buttons/default_button.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Страница корзины
class BasketScreen extends ElementaryWidget<IBasketScreenWidgetModel> {
  const BasketScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultAppWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IBasketScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: wm.goBack,
          child: Icon(
            Icons.chevron_left_rounded,
            color: primaryColor,
            size: 40.r,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 9.h),
                        child: TextLocale(
                          'basket',
                          style: textBold800Size26Black,
                        ),
                      ),
                    ),
                    Expanded(
                        child: EntityStateNotifierBuilder<List<BasketDomain>>(
                            listenableEntityState: wm.basketList,
                            builder: (BuildContext context,
                                List<BasketDomain>? basketList) {
                              return ListView(
                                children: [
                                  ...?basketList?.map(
                                    (e) => Padding(
                                      padding: EdgeInsets.only(bottom: 30.h),
                                      child: BasketCard(
                                        item: e,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            })),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 5.h,
              color: Color(0xFFF6F7FB),
            ),
            Container(
              width: double.infinity,
              color: whiteColor,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: TextLocale(
                      'total_to_pay',
                      style: textBold700Size30Black,
                    ),
                  ),
                  //todo общая сумма
                  Padding(
                    padding: EdgeInsets.only(bottom: 31.h),
                    child: TextLocale(
                      '\$ 1500.00 ',
                      style: textPrimary700Size30Primary,
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                    width: double.infinity,
                    child: PrimaryButton(
                      onPressed: wm.chooseAccount,
                      text: 'buy',
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static route() => MaterialPageRoute(builder: (context) => BasketScreen());
}

/// Навигация к странице [BasketScreen]
class BasketScreenRoute extends MaterialPageRoute {
  BasketScreenRoute()
      : super(
          builder: (context) => const BasketScreen(),
        );
}
