import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/styles.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/exchange/exchange_invest_view/widgets/exchange_status_view.dart';
import 'package:one_trade/ui/widgets/buttons/default_button.dart';
import 'package:one_trade/ui/widgets/form/primary_text_field.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Страница введение суммы для вывода средств
class WithdrawSumView extends StatelessWidget {
  const WithdrawSumView({Key? key}) : super(key: key);

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
              // constraints: minHeight != null
              //     ? BoxConstraints(minHeight: minHeight!)
              //     : null,
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
                    TextLocale(
                      'enter_sum_and_card',
                      style: textPrimary700Size36Black,
                    ),
                    SizedBox(height: 60.h),
                    TextLocale(
                      'account_number',
                      style: textPrimary500Size18Grey3,
                    ),
                    SizedBox(height: 10.h),
                    PrimaryTextField(
                      value: '',
                      height: 75.h,
                      hintText: '4785 2303 4591 6700',
                    ),
                    SizedBox(height: 30.h),
                    TextLocale(
                      'account_number',
                      style: textPrimary500Size18Grey3,
                    ),
                    SizedBox(height: 10.h),
                    PrimaryTextField(
                      value: '',
                      height: 75.h,
                      hintText: '00.00 \$',
                    ),
                    SizedBox(height: 60.h),
                    SizedBox(
                      width: double.infinity,
                      height: 60.h,
                      child: PrimaryButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isDismissible: true,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => ExchangeStatusView(),
                          );
                        },
                        text: 'pay',
                      ),
                    ),
                    SizedBox(height: 60.h),
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
