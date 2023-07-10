import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Метод для открытия диалогового окна
void showPopUp<T>(BuildContext context, Widget dialogBody) {
  showModalBottomSheet<T>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.vertical(
        top: Radius.circular(10.0.r),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return dialogBody;
    },
  );
}
