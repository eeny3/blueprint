import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/styles.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/exchange/exchange_invest_view/widgets/exchange_status_view.dart';
import 'package:one_trade/ui/widgets/buttons/default_button.dart';
import 'package:one_trade/ui/widgets/form/primary_text_field.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Страница ввода суммы
class SumEnterView extends StatefulWidget {
  const SumEnterView({Key? key}) : super(key: key);

  @override
  State<SumEnterView> createState() => _SumEnterViewState();
}

class _SumEnterViewState extends State<SumEnterView> {
  @override
  Widget build(BuildContext context) {
    String value = '';
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
                        'choose_exchange_account',
                        style: textBold800Size26Black,
                      ),
                    ),
                    SizedBox(height: 60.h),
                    PrimaryTextField(
                      value: value,
                      onChange: (value) {
                        setState(() {
                          value = value;
                        });
                      },
                      hintText: '00.00\$',
                      height: 75.h,
                    ),
                    SizedBox(height: 53.h),
                    SizedBox(
                      height: 60.h,
                      width: double.infinity,
                      child: PrimaryButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          showModalBottomSheet(
                            context: context,
                            isDismissible: true,
                            isScrollControlled: true,
                            builder: (context) => ExchangeStatusView(),
                          );
                        },
                        text: 'pay',
                      ),
                    ),
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
