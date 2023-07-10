import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// UI кнопки страницы
class CustomButton extends StatelessWidget {
  /// Текст на кнопке
  final String title;

  /// Действие кнопки
  final VoidCallback onTap;

  /// Активна ли кнопка
  final bool isActive;

  const CustomButton(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity.w,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isActive ?  primaryColor : blue3,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: TextLocale(
            title,
            style: textBold700Size18.copyWith(
              color: whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
