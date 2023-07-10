import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/form/primary_text_field.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Страница статуса перевода
class ExchangeStatusView extends StatefulWidget {
  const ExchangeStatusView({Key? key}) : super(key: key);

  @override
  State<ExchangeStatusView> createState() => _ExchangeStatusViewState();
}

class _ExchangeStatusViewState extends State<ExchangeStatusView> {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    SizedBox(height: 21.h),
                    SvgPicture.asset(
                      icPending,
                      width: 75.r,
                      height: 75.r,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: TextLocale(
                        'pending',
                        style: textBold700Size24Pending,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 24.h),
                      // TODO set date
                      child: Text(
                        '01.03.2022 12:56 PM',
                        style: textPrimary600Size16Black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 24.h),
                      child: RichText(
                        text: TextSpan(
                            text: '+100',
                            style: textBold700Size40Black,
                            children: [
                              TextSpan(
                                text: '.00 USD',
                                style: textBold700Size40BlackAccent,
                              ),
                            ]),
                      ),
                    ),
                    Divider(
                      thickness: 10.h,
                      color: Color(0xFFF6F7FB),
                    ),
                    SizedBox(height: 25.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextLocale(
                            'account',
                            style: textBold700Size18,
                          ),
                          // TODO set account number
                          Text(
                            '823258',
                            style: textPrimary500Size18BlueGrey,
                          ),
                          SizedBox(height: 15.h),
                          TextLocale(
                            'exchange_number',
                            style: textBold700Size18,
                          ),
                          // TODO set exchange_number
                          Text(
                            '823258',
                            style: textPrimary500Size18BlueGrey,
                          ),
                          SizedBox(height: 15.h),
                          TextLocale(
                            'payment_system',
                            style: textBold700Size18,
                          ),
                          // TODO set payment system
                          Text(
                            'Банковская карта',
                            style: textPrimary500Size18BlueGrey,
                          ),
                          SizedBox(height: 15.h),
                          TextLocale(
                            'comment',
                            style: textBold700Size18,
                          ),
                          // TODO set comment
                          Text(
                            'Повседневная практика показывает, '
                            'что постоянное информационно-пропагандистское обеспечение '
                            'нашей деятельности обеспечивает широкому кругу (специалистов) '
                            'участие в формировании форм развития',
                            style: textPrimary500Size18BlueGrey,
                          ),
                          SizedBox(height: 15.h),
                        ],
                      ),
                    )
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
