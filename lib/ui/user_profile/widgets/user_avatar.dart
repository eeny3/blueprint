import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';

class UserAvatar extends StatelessWidget {
  // Первая буква имени (фамилии)
  final String letter;

  const UserAvatar({
    Key? key,
    required this.letter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      width: 88.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryColor.withOpacity(0.5),
      ),
      child: Center(
        child: Text(
          letter,
          style: textBold800Size36White,
        ),
      ),
    );
  }
}
