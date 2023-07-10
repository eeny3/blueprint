import 'package:flutter/material.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';

class PageTextField extends StatelessWidget {
  /// Подсказка текстового поля
  final String hintText;
  /// Контроллер поля
  final TextEditingController controller;
  /// Включено ли поле
  final bool isEnabled;

  const PageTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: isEnabled,
      controller: controller,
      decoration: InputDecoration(
        //TODO добавить лейбл как в дизайне
        hintText: hintText,
        hintStyle: textPrimary400Size16BlueGrey4,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: grey5,
          ),
        ),
      ),
      style: textPrimary600Size16Black,
    );
  }
}
