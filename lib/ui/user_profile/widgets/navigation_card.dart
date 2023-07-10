import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/shadows.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Карточка для навигации по профилю пользователя
class NavigationCard extends StatelessWidget {
  // Заголовок карточки
  final String title;

  // Заливка
  final bool isFilling;

  // Действие при нажатии
  final VoidCallback? onTap;

  const NavigationCard({
    Key? key,
    required this.title,
    this.onTap,
    this.isFilling = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 360.w,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: isFilling ? primaryColor : whiteColor,
        boxShadow: [defaultShadow],
      ),
      child: Material(
        type: MaterialType.transparency,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextLocale(
                  title,
                  style: isFilling
                      ? textPrimary600Size18White
                      : textPrimary600Size18Black,
                ),
                Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isFilling ? whiteColor : primaryColor,
                  ),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    color: isFilling ? primaryColor : whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
