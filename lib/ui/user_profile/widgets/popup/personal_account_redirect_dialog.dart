import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Виджет диалога для перенаправления в личный кабинет
class PersonalAccountRedirectDialogBody extends StatelessWidget {
  /// Действие по нажатию на кнопку перехода к личному кабинету
  final VoidCallback onGoToPersonalAccountTapped;

  const PersonalAccountRedirectDialogBody({
    required this.onGoToPersonalAccountTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 551.h,
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
          Padding(
            padding: EdgeInsets.only(
              left: 23.w,
              right: 15.w,
            ),
            child: TextLocale(
              'feature_not_available',
              style: textPrimary700Size36Black,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 23.w,
              right: 15.w,
            ),
            child: TextLocale(
              'personal_account_redirect_prompt',
              style: textPrimary500Size24Grey3,
            ),
          ),
          SizedBox(
            height: 75.h,
          ),
          Container(
            width: 360.w,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Material(
              type: MaterialType.transparency,
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: onGoToPersonalAccountTapped,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: TextLocale(
                      'go_personal_account',
                      style: textBold700Size18White,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
