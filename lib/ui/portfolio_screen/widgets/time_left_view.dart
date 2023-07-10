import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';


/// Счетик остатка времени
class TimeLeftView extends StatelessWidget {
  const TimeLeftView({
    Key? key,
    this.days = 0,
    this.hours = 0,
    this.minutes = 0,
    this.seconds = 0,
  }) : super(key: key);

  final int days;
  final int hours;
  final int minutes;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 91.h,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                color: blueAccent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$days',
                    style: textPrimary500Size36Black,
                  ),
                  TextLocale(
                    'days',
                    style: textPrimary500Size14BlueGrey,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                color: blueAccent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$hours',
                    style: textPrimary500Size36Black,
                  ),
                  TextLocale(
                    'hours',
                    style: textPrimary500Size14BlueGrey,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                color: blueAccent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$minutes',
                    style: textPrimary500Size36Black,
                  ),
                  TextLocale(
                    'minutes',
                    style: textPrimary500Size14BlueGrey,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                color: blueAccent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$seconds',
                    style: textPrimary500Size36Black,
                  ),
                  TextLocale(
                    'seconds',
                    style: textPrimary500Size14BlueGrey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
