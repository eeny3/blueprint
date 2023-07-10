import 'package:flutter/material.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// ЮИ нижней части страницы
class PhoneInputScreenFooter extends StatelessWidget {
  const PhoneInputScreenFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: TextLocale(
            'phone_input_screen_footer',
            style: textPrimary300Size16Grey4,
          ),
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: TextLocale(
            'terms_of_use',
            style: textPrimary500Size16DarkBlue,
          ),
        ),
      ],
    );
  }
}
