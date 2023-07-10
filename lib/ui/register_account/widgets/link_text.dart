import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Виджет текста с ссылкой
class LinkText extends StatelessWidget {
  const LinkText({Key? key, this.text = ''}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextLocale(
            text,
            style: textPrimary500Size18LinkColorUnderline,
          ),
        ),
        SvgPicture.asset(
          icCheckCircle,
          width: 24.r,
          height: 24.r,
        )
      ],
    );
  }
}
