import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// UI верхней части страницы
class PasswordInputScreenHeader extends StatelessWidget {
  final String headerTitle;

  const PasswordInputScreenHeader({
    Key? key,
    required this.headerTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: TextLocale(
            headerTitle,
            style: textBold700Size30Black,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextLocale(
          'password_input_screen_header',
          style: textPrimary500Size16SubGreyBlueColor,
        ),
      ],
    );
  }
}