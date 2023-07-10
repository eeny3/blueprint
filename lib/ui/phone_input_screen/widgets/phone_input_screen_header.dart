import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// ЮИ верхней части страницы
class PhoneInputScreenHeader extends StatelessWidget {
  const PhoneInputScreenHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextLocale(
          'enter_phone_number',
          style: textBold700Size30Black,
        ),
        SizedBox(
          height: 10.h,
        ),
        TextLocale(
          'phone_input_screen_header',
          style: textPrimary500Size16Grey8,
        ),
        SizedBox(
          height: 12.h,
        ),
      ],
    );
  }
}
