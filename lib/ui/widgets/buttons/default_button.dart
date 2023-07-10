import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/styles.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Виджет первичная кнопка
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.onPressed,
    this.style,
    this.textStyle,
    this.text = '',
    this.isLoading = false,
  }) : super(key: key);

  final Function()? onPressed;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style ?? roundedRadius15Primary,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15.h,
          ),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: whiteColor,
                  ),
                )
              : TextLocale(
                  text,
                  style: textStyle ?? textBold500Size18White,
                ),
        ),
      ),
    );
  }
}
