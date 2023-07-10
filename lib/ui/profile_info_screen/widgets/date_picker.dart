import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/interactors/locale/locale_interactor.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/password_input_screen/widgets/password_input_screen_button.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

class DatePicker extends StatefulWidget {
  /// Контроллер текстового поля для даты
  final TextEditingController dobFieldController;

  const DatePicker({Key? key, required this.dobFieldController})
      : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 50.h,
      ),
      height: 500.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextLocale(
            'date_of_birth',
            style: textPrimary700Size48Black,
          ),
          //TODO приблизить к дизайну
          Container(
            height: 220.h,
            padding: EdgeInsets.only(top: 50.0.w),
            color: whiteColor,
            child: DefaultTextStyle(
              style: textPrimary500Size34Black,
              child: SafeArea(
                top: false,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: dateTime,
                  onDateTimeChanged: (DateTime newDateTime) {
                    if (mounted) {
                      setState(() => dateTime = newDateTime);
                    }
                  },
                ),
              ),
            ),
          ),
          const Spacer(),
          CustomButton(
            title: getLocaleString('ready'),
            onTap: () {
              widget.dobFieldController.text = '${dateTime.day}.${dateTime.month}.${dateTime.year}';
              Navigator.pop(context);
            },
            isActive: true,
          ),
        ],
      ),
    );
  }
}
