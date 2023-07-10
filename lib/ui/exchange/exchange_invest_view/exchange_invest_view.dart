import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/interactors/locale/locale_interactor.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/shadows.dart';
import 'package:one_trade/resources/styles.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/exchange/exchange_invest_view/exchange_invest_view_wm.dart';
import 'package:one_trade/ui/exchange/widgets/account_card.dart';
import 'package:one_trade/ui/widgets/buttons/default_button.dart';

import 'package:one_trade/ui/widgets/form/primary_text_field.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Страницы перевода средств инвестиции
class ExchangeInvestView
    extends ElementaryWidget<IExchangeInvestViewWidgetModel> {
  const ExchangeInvestView({
    Key? key,
    WidgetModelFactory wmFactory = defaultAppWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IExchangeInvestViewWidgetModel wm) {
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
                    height: 35.h,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 5.h,
                        horizontal: 20.w,
                      ),
                    ),
                    onChange: (value) {},
                  ),
                  Expanded(
                      child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    children: [
                      // TODO данные с бэка
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
                bottom: 17.h,
                left: 32.w,
                right: 32.w,
                child: SizedBox(
                  height: 60.h,
                  child: PrimaryButton(
                    onPressed: wm.submitExchangeInvest,
                    text: 'pay',
                  ),
                ),
              ),
            ],
          );
        });
  }
}
