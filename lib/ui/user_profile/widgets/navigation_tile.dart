import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Карточка для навигации по профилю пользователя
class NavigationTile extends StatelessWidget {
  // Заголовок карточки
  final String titleKey;

  // Действие при нажатии
  final VoidCallback? onTap;

  const NavigationTile({
    Key? key,
    required this.titleKey,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 55.h,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                  right: 21.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextLocale(
                      titleKey,
                      style: textPrimary400Size17GreyAccent,
                    ),
                    Icon(
                      size: 30.h,
                      Icons.chevron_right_rounded,
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Divider(
            height: 1.h,
          ),
        ),
      ],
    );
  }
}
