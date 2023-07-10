import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/interactors/locale/lang_code.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Виджет диалога для смены язык
class LanguageSelectDialogBody extends StatelessWidget {
  /// Действие по нажатию на язык
  final void Function(LangCode) onChangeLanguageTapped;

  const LanguageSelectDialogBody({
    required this.onChangeLanguageTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 3.h,
            width: 30.w,
            decoration: BoxDecoration(
              color: gray5,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  90.r,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
          TextLocale(
            'choose_language',
            style: textPrimary700Size36Black,
          ),
          SizedBox(
            height: 25.h,
          ),
          GestureDetector(
            onTap: () {
              // TODO: Когда локаль станет доступна - поменять
              // onChangeLanguageTapped(LangCode.en);
              onChangeLanguageTapped(LangCode.ru);
            },
            child: TextLocale(
              'english',
              style: textPrimary500Size20Grey3,
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          GestureDetector(
            onTap: () {
              onChangeLanguageTapped(LangCode.ru);
            },
            child: TextLocale(
              'russian',
              style: textPrimary500Size20Grey3,
            ),
          ),
        ],
      ),
    );
  }
}
