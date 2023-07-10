import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Класс для верхней части экрана в verification_screen
class VerificationScreenHeader extends StatelessWidget {
  /// Значение для отображения номера телефона
  final String phoneNumber;

  const VerificationScreenHeader({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: TextLocale(
            'sms_code_is_sent',
            style: textPrimary700Size22Black,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            TextLocale(
              'to_number',
              style: textPrimary400Size16Grey4,
            ),
            Text(
              phoneNumber,
              style: textPrimary400Size16Grey4.copyWith(
                color: blue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
