import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/domain/order_domain.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/styles.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/buttons/default_button.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Страница подробностей сделки
class DealDetailScreen extends StatelessWidget {
  const DealDetailScreen({Key? key, this.order}) : super(key: key);

  final OrderDomain? order;

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 60.h),
                child: TextLocale(
                  'deal_title',
                  namedArgs: {
                    'login': '#111771',
                  },
                  style: textBold800Size26Black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 11.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: blueAccent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextLocale(
                        'order',
                        style: textPrimary600Size16Accent,
                      ),
                      Text(
                        '${order?.id}',
                        style: textPrimary600Size16Black,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 11.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: blueAccent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextLocale(
                        'volume',
                        style: textPrimary600Size16Accent,
                      ),
                      Text(
                        '${order?.volume}',
                        style: textPrimary600Size16Black,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 11.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: blueAccent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextLocale(
                        'symbol',
                        style: textPrimary600Size16Accent,
                      ),
                      Text(
                        '${order?.symbol}',
                        style: textPrimary600Size16Black,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 11.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: blueAccent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextLocale(
                        'open_price',
                        style: textPrimary600Size16Accent,
                      ),
                      Text(
                        '${order?.openPrice} \$',
                        style: textPrimary600Size16Black,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 11.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: blueAccent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextLocale(
                        'price_increase',
                        style: textPrimary600Size16Accent,
                      ),
                      // TODO percent
                      Text(
                        '\$ ${order?.currentPricePercent} /25.00 %',
                        style: textPrimary600Size16Black,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 11.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: blueAccent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextLocale(
                        'open_date',
                        style: textPrimary600Size16Accent,
                      ),
                      Text(
                        '${order?.openTime}',
                        style: textPrimary600Size16Black,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 11.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: blueAccent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextLocale(
                        'profit',
                        style: textPrimary600Size16Accent,
                      ),
                      Text(
                        '${order?.profit} %',
                        style: textPrimary600Size16Black,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 60.h),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 11.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: blueAccent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextLocale(
                        'commission_open',
                        style: textPrimary600Size16Accent,
                      ),
                      Text(
                        '${order?.commissionOpen} \$',
                        style: textPrimary600Size16Black,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  style: roundedRadius15Transparent,
                  text: 'close',
                  textStyle: textPrimary700Size18Danger,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// Навигация к странице [DealDetailScreen]
class DealDetailScreenRoute extends MaterialPageRoute {
  DealDetailScreenRoute(OrderDomain order)
      : super(
          builder: (context) => DealDetailScreen(
            order: order,
          ),
        );
}
