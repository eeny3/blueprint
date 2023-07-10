import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/shadows.dart';
import 'package:one_trade/ui/portfolio_screen/widgets/time_left_view.dart';

/// Карточка активной ipo
class ActualShareTradeView extends StatelessWidget {
  const ActualShareTradeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 277,
      padding: EdgeInsets.all(20),
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
              'Мерос Фонд США',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            '2 372 385.00 USD',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Spacer(),
          TimeLeftView()
        ],
      ),
    );
  }
}
