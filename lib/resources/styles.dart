import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';

ButtonStyle roundedRadius15Transparent = ElevatedButton.styleFrom(
  backgroundColor: Colors.transparent,
  elevation: 0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15.r),
    ),
  ),
);

ButtonStyle roundedRadius15Primary = ElevatedButton.styleFrom(
  backgroundColor: primaryColor,
  elevation: 0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15.r),
    ),
  ),
);
