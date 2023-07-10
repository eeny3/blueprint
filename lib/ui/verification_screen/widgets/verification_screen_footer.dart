import 'package:flutter/material.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';
import 'package:one_trade/utils/date_time_utils.dart';

/// Класс для нижней части экрана в verification_screen
class VerificationScreenFooter extends StatelessWidget {
  /// Значения в секундах для таймера
  final int countdown;

  const VerificationScreenFooter({
    Key? key,
    required this.countdown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: countdown == 0
              ? TextLocale(
                  'resend_code',
                  style: textPrimary400Size14Blue,
                )
              : Row(
                  children: [
                    TextLocale(
                      'resend_countdown',
                      style: textPrimary300Size16Grey4,
                    ),
                    Text(
                      formTommss(countdown),
                      style: textPrimary400Size14Blue,
                    )
                  ],
                ),
        ),
      ],
    );
  }
}
