import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/form/primary_text_field.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';
import 'package:one_trade/ui/withdraw/widgets/withdraw_type_card.dart';

/// Страница выбора типа платежа вывода средств
class WithdrawTypeSelectView extends StatelessWidget {
  const WithdrawTypeSelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Wrap(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.r),
            ),
            clipBehavior: Clip.hardEdge,
            child: Container(
              color: Colors.transparent,
              child: Container(
                width: double.infinity,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.r),
                  ),
                  color: whiteColor,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.h),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          color: const Color(0xFFE5EBF0),
                          height: 4.h,
                          width: 40.w,
                        ),
                      ),
                    ),
                    SizedBox(height: 60.h),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: TextLocale(
                        'withdraw_from_account',
                        style: textPrimary700Size36Black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: TextLocale(
                        'choose_withdraw_from_account',
                        style: textPrimary500Size24Grey3,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    WithdrawTypeCard(),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
