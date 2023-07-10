import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Виджет кнопка для таб бара
class TabButton extends StatelessWidget {
  const TabButton({
    Key? key,
    required this.onClick,
    this.isActive = false,
    this.label = '',
  }) : super(key: key);

  final void Function() onClick;
  final bool isActive;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.only(right: 5.w),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 27.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.r)),
          border: isActive
              ? null
              : Border.all(
                  color: greyBlueColor,
                ),
          color: isActive ? primaryColor : whiteColor,
        ),
        child: TextLocale(
          label,
          style:
              isActive ? textPrimary700Size16White : textPrimary500Size16BlueGrey,
        ),
      ),
    );
  }
}
