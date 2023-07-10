import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/interactors/locale/locale_interactor.dart';
import 'package:one_trade/resources/text_styles.dart';

/// Кастомное текстовое поле страницы
class PasswordTextField extends StatefulWidget {
  /// Цвет тестфилда
  final Color inputColor;

  /// контроллер
  final TextEditingController controller;

  /// Функция для апдейта стейта кнопки
  final Function(String) onChanged;

  const PasswordTextField({
    Key? key,
    required this.inputColor,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: widget.inputColor,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        controller: widget.controller,
        style: textBold500Size30GreyAccentSpacing10,
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 18.w),
          filled: true,
          hintText: getLocaleString('password'),
          hintStyle: textPrimary400Size30GreyBlueColor,
          fillColor: widget.inputColor,
          border: InputBorder.none,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
