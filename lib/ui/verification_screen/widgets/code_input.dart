import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';
import 'package:one_trade/utils/collections_utils.dart';

/// Виджет поле для ввода кода
class CodeInput extends StatelessWidget {
  /// Текст кода
  final String code;
  /// Статус кода
  final bool isCorrectInput;
  /// Лист для символов кода
  final List<String> symbolsList;

  CodeInput({super.key, required this.code, required this.isCorrectInput})
      : symbolsList = intersperse(
          '',
          [...code.split(''), '', '', '', ''].sublist(0, 4),
        ).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            for (int i = 0; i < symbolsList.length; i++)
              i % 2 != 0
                  ? SizedBox(
                      width: 10.w,
                    )
                  : Expanded(
                      child: CodeInputTile(
                        codeChar: symbolsList[i],
                        color: isCorrectInput
                            ? lightGrey
                            : dangerColorLessOpacity,
                      ),
                    ),
          ],
        ),
        SizedBox(height: 16.h),
        TextLocale(
          'incorrect_code',
          textAlign: TextAlign.center,
          style: !isCorrectInput
              ? textPrimary400Size14Primary.copyWith(
                  color: dangerColor,
                )
              : textPrimary400Size14Primary.copyWith(
                  color: whiteColor,
                ),
        ),
      ],
    );
  }
}

class CodeInputTile extends StatelessWidget {
  final String codeChar;
  final Color color;
  final String hintCodeText = '4';
  final charInputAspectRatio = 7 / 9;

  const CodeInputTile({
    Key? key,
    required this.codeChar,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: charInputAspectRatio,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 17.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: codeChar.isNotEmpty
                ? Text(
                    codeChar,
                    style: textBold500Size48Black,
                  )
                : Text(
                    hintCodeText,
                    style: textBold500Size48Grey7,
                  ),
          ),
        ),
      ),
    );
  }
}
