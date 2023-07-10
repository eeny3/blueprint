import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:one_trade/domain/stock_domain.dart';
import 'package:one_trade/interactors/locale/locale_interactor.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/shadows.dart';
import 'package:one_trade/resources/text_styles.dart';


/// Карточка стока (IPO)
class ShareCard extends StatelessWidget {
  const ShareCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final StockDomain item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25.r)),
        color: whiteColor,
        boxShadow: [
          defaultShadow,
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Image.network(
              item.logoUri,
              width: 125.w,
              height: 42.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text(
              item.title,
              style: textPrimary700Size20,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: RichText(
              text: TextSpan(
                text: getLocaleString('ipo_date'),
                style: textPrimary500Size14Accent,
                children: [
                  TextSpan(text: ' '),
                  if (item.ipoDate != null)
                    TextSpan(
                      text: DateFormat('dd.MM.yy').format(item.ipoDate!),
                      style: textPrimary500Size14Black,
                    )
                ],
              ),
            ),
          ),
          Text(
            '+ ${item.accommodationPrice}%',
            style: textPrimary500Size14Success,
          ),
        ],
      ),
    );
  }
}
