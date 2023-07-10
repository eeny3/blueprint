import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Виджет с информацией о пользователе и возможность редактирования
class UserInfoWidget extends StatelessWidget {
  // Тип данных
  final String propertyKey;

  /// Действие по нажатии на поле
  final VoidCallback? onTextFieldTap;

  // Контроллер для данных
  final TextEditingController controller;

  const UserInfoWidget({
    Key? key,
    required this.propertyKey,
    required this.controller,
    this.onTextFieldTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextLocale(
            propertyKey,
            style: textPrimary400Size14Accent,
          ),
          SizedBox(
            height: 6.h,
          ),
          TextField(
            // Дейтствие при нажатии на поле
            onTap: onTextFieldTap,
            // Если передан колбэк, отключем дефолтное поведение
            enableInteractiveSelection: onTextFieldTap != null ? false : true,
            focusNode: onTextFieldTap != null
                ? AlwaysDisabledFocusNode()
                : FocusNode(),
            controller: controller,
            style: textPrimary600Size16BlueBlack,
            decoration: const InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 0,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}

/// Отключение возможности получения фокуса поля
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
