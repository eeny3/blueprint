import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/shadows.dart';
import 'package:one_trade/resources/text_styles.dart';

/// Карточка информации счета пользователя
class AccountDetailsCard extends StatelessWidget {
  const AccountDetailsCard({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: blueAccent,
        boxShadow: [defaultShadow],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$label',
            style: textPrimary500Size16BlueGrey,
          ),
          Spacer(),
          RichText(
            text: TextSpan(
                text: '15',
                style: textPrimary700Size16GreyAccent,
                children: [
                  TextSpan(
                    text: '.00 USD',
                    style: textPrimary500Size16BlueGrey,
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
