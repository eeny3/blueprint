import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/domain/stock_domain.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/shadows.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/pre_ipo_detail/pre_ipo_detail_wm.dart';
import 'package:one_trade/ui/widgets/buttons/default_button.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';
import 'package:one_trade/ui/widgets/text/collapsed_text.dart';

/// Страница Pre Ipo детально
class PreIpoDetailScreen extends ElementaryWidget<IPreIpoDetailWidgetModel> {
  const PreIpoDetailScreen({
    Key? key,
    required this.preIpo,
    WidgetModelFactory wmFactory = defaultAppWidgetModelFactory,
  }) : super(wmFactory, key: key);

  final StockDomain preIpo;

  @override
  Widget build(IPreIpoDetailWidgetModel wm) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FB),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 9.h),
                    child: TextLocale(
                      preIpo.title,
                      style: textBold800Size26Black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 9.h),
                    child: RichText(
                      text: TextSpan(
                          text: '\$ ${preIpo.accommodationPrice}',
                          style: textPrimary700Size40Success,
                          children: [
                            TextSpan(
                              text: '.00',
                              style: textPrimary700Size40SuccessAccent,
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(height: 45.h),
                  Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      boxShadow: [defaultShadow],
                      color: whiteColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: wm.minus,
                          child: Container(
                            height: 60.h,
                            width: 60.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: primaryColor,
                            ),
                            child: Center(child: SvgPicture.asset(icSubstruct)),
                          ),
                        ),
                        EntityStateNotifierBuilder<int>(
                            listenableEntityState: wm.count,
                            builder: (BuildContext context, int? count) {
                              return RichText(
                                text: TextSpan(
                                  text: '$count • ${preIpo.accommodationPrice}',
                                  style: textPrimary600Size20Black,
                                  children: [
                                    TextSpan(
                                      text: '.00 USD',
                                      style: textBold600Size20Grey3,
                                    ),
                                  ],
                                ),
                              );
                            }),
                        InkWell(
                          onTap: wm.plus,
                          child: Container(
                            height: 60.h,
                            width: 60.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: primaryColor,
                            ),
                            child: Center(child: SvgPicture.asset(icProduct)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    height: 60.h,
                    width: double.infinity,
                    child: PrimaryButton(
                      onPressed: wm.addToCart,
                      text: 'add_to_cart',
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: whiteColor,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: TextLocale(
                          'about_company',
                          style: textBold700Size24Black,
                        ),
                      ),
                      // TODO текст с бэка
                      Padding(
                        padding: EdgeInsets.only(bottom: 30.h),
                        child: CollapsedText(
                          shortText: preIpo.shortDescription,
                          text: preIpo.longDescription,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: TextLocale(
                          'investors',
                          style: textBold700Size24Black,
                        ),
                      ),
                      // tODO текст с бэка
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: TextLocale(
                          'Advent International',
                          style: textBold700Size16Black,
                        ),
                      ),
                      // tODO текст с бэка
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: TextLocale(
                          'Hermes, BigPanda, Nubank, Thrasio, Parmalat, Shift Technology',
                          style: textBold400Size16Black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// Навигация к странице [PreIpoDetailScreen]
class PreIpoDetailScreenRoute extends MaterialPageRoute {
  PreIpoDetailScreenRoute(StockDomain stock)
      : super(
          builder: (context) => PreIpoDetailScreen(
            preIpo: stock,
          ),
        );
}
