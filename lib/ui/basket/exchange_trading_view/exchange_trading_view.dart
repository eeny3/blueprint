import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/interactors/locale/locale_interactor.dart';
import 'package:one_trade/ui/basket/exchange_trading_view/exchange_trading_view_wm.dart';
import 'package:one_trade/ui/exchange/widgets/account_card.dart';
import 'package:one_trade/ui/widgets/buttons/default_button.dart';

import 'package:one_trade/ui/widgets/form/primary_text_field.dart';

/// Страница вывода средств
class ExchangeTradingView
    extends ElementaryWidget<IExchangeTradingViewWidgetModel> {
  const ExchangeTradingView({
    Key? key,
    WidgetModelFactory wmFactory = defaultAppWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IExchangeTradingViewWidgetModel wm) {
    return EntityStateNotifierBuilder<List<dynamic>>(
        listenableEntityState: wm.accounts,
        builder: (BuildContext context, List<dynamic>? accounts) {
          if ((accounts ?? []).isEmpty) {
            return SizedBox();
          }
          return Stack(
            children: [
              Column(
                children: [
                  PrimaryTextField(
                    value: '',
                    hintText: getLocaleString('search'),
                    backgroundColor: Color(0xFFEEEEEE),
                    height: 35.h,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                    ),
                    onChange: (value) {},
                  ),
                  Expanded(
                      child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    children: [
                      // TODO данные придут с бэка
                      ...[1, 2, 3, 4, 5, 6, 7].map(
                        (e) => AccountCard(
                          isSelected: e == 1,
                        ),
                      )
                    ],
                  ))
                ],
              ),
              Positioned(
                bottom: 17,
                left: 32,
                right: 32,
                child: SizedBox(
                  height: 60.h,
                  child: PrimaryButton(
                    onPressed: wm.submitPayment,
                    text: 'pay',
                  ),
                ),
              ),
            ],
          );
        });
  }
}
