import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/domain/basket_domain.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/shadows.dart';
import 'package:one_trade/resources/styles.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/buttons/default_button.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';
/// Карточка корзины
class BasketCard extends StatelessWidget {
  const BasketCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final BasketDomain item;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [defaultShadow],
      ),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'HashiCorp',
                  style: textBold700Size24Black,
                ),
                GestureDetector(
                  onTap: () => _showDeleteDialog(context),
                  child: SvgPicture.asset(
                    icXClose,
                    color: dangerColor,
                    width: 32.r,
                    height: 32.r,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 2.5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: RichText(
                text: TextSpan(
                    text: '150',
                    style: textPrimary600Size24Success,
                    children: [
                      TextSpan(
                        text: '.00 \$',
                        style: textPrimary600Size24SuccessAccent,
                      ),
                    ]),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            // TODO set
            child: Text(
              'Минимальная сумма позиции в корзине - 500 USD',
              style: textPrimary500Size12Danger,
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            height: 60.h,
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60.h,
                  width: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: dangerColor.withOpacity(0.12),
                  ),
                  child: Center(
                      child: SvgPicture.asset(
                    icSubstruct,
                    width: 20.w,
                    height: 3.h,
                    color: dangerColor,
                  )),
                ),
                RichText(
                  text: TextSpan(
                    text: '1  • 23',
                    style: textPrimary600Size20Black,
                    children: [
                      TextSpan(
                        text: '.00 USD',
                        style: textBold600Size20Grey3,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60.h,
                  width: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: primaryColor.withOpacity(0.12),
                  ),
                  child: Center(
                      child: SvgPicture.asset(
                    icProduct,
                    width: 20.r,
                    height: 20.r,
                    color: primaryColor,
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) async {
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
                height: 210.h,
                margin: EdgeInsets.symmetric(horizontal: 25.w),
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                  horizontal: 15.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  color: whiteColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: TextLocale(
                        'Вы действительно хотите удалить Thrasio из корзины?',
                        style: textPrimary600Size26GreyAccent,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 55.h,
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 55.h,
                              child: PrimaryButton(
                                onPressed: () {},
                                text: 'delete',
                                style: roundedRadius15Transparent,
                                textStyle: textPrimary500Size18Danger,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 55.h,
                              child: PrimaryButton(
                                onPressed: () {},
                                text: 'cancel',
                                textStyle: textBold500Size18White,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
