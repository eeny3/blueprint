import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/text_styles.dart';

/// Цифра компонент нумпада
class NumpadDigit extends StatelessWidget {
  /// Текст на кнопке
  final String value;
  /// Действие
  final ValueChanged<String> onKeyboardTap;

  const NumpadDigit(
      {Key? key, required this.value, required this.onKeyboardTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: ValueKey(value),
      borderRadius: BorderRadius.circular(45.r),
      onTap: () {
        onKeyboardTap(value);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 32.w,
          vertical: 18.5.w,
        ),
        child: Text(
          value,
          style: textBold600Size30Black,
        ),
      ),
    );
  }
}
