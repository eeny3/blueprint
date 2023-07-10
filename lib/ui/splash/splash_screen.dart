import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/styles.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/buttons/default_button.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Страница загрузки приложения
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    barrierColor: Color(0x80183256),
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Material(
                          color: Colors.transparent,
                          child: Center(
                            child: Container(
                              height: 300.h,
                              margin: EdgeInsets.symmetric(horizontal: 25.w),
                              padding: EdgeInsets.only(
                                top: 40.h,
                                bottom: 20.h,
                                left: 20.w,
                                right: 20.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.r)),
                                color: whiteColor,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 18.h),
                                    child: TextLocale(
                                      'no_network',
                                      style: textPrimary600Size26GreyAccent,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 18.h),
                                    child: TextLocale(
                                      'no_network_desc',
                                      style: textPrimary500Size22Grey3,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: PrimaryButton(
                                      onPressed: () {},
                                      text: 'ok',
                                      style: roundedRadius15Transparent,
                                      textStyle: textPrimary500Size18Primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: Text(
                'MEROS',
                style: textBold700Size64White,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 17),
              child: TextLocale(
                'app_version ${0.1}',
                style: textPrimary500Size14White,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
