import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Тело диалога для выбора даты рождения
class DatePickerDialogBody extends StatelessWidget {
  /// Колбэк, который вызывется при изменении даты
  final void Function(DateTime) onDateChanged;

  /// Действие при  сохранении выбранной даты
  final VoidCallback onDateSaved;

  const DatePickerDialogBody({
    super.key,
    required this.onDateChanged,
    required this.onDateSaved,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 510.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 3.h,
            width: 30.w,
            decoration: BoxDecoration(
              color: gray5,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  90.r,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 35.h,
          ),
          TextLocale(
            'day_of_birth',
            style: textBold700Size48Black,
          ),
          SizedBox(
            height: 76.h,
          ),
          SizedBox(
            height: 90.h,
            child: CustomDatePicker(
              onDateChanged: onDateChanged,
            ),
          ),
          SizedBox(
            height: 80.h,
          ),
          Container(
            width: 360.w,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Material(
              type: MaterialType.transparency,
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: onDateSaved,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: TextLocale(
                      'done',
                      style: textBold700Size18White,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDatePicker extends StatefulWidget {
  /// Колбэк, который вызывется при изменении даты
  final void Function(DateTime) onDateChanged;

  const CustomDatePicker({
    super.key,
    required this.onDateChanged,
  });

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late List<int> days;

  List<int> longMonthDays = List.generate(31, (i) => i + 1);

  List<int> shortMonthDays = List.generate(30, (i) => i + 1);

  List<int> longFebruaryDays = List.generate(29, (i) => i + 1);

  List<int> shortsFebruaryDays = List.generate(28, (i) => i + 1);

  List<int> years = List.generate(123, (i) => i + 1900);

  @override
  void initState() {
    days = longMonthDays;
    super.initState();
  }

  List<String> monthsKeys = [
    "january",
    "february",
    "march",
    "april",
    "may",
    "june",
    "july",
    "august",
    "september",
    "october",
    "november",
    "december",
  ];

  /// Проверка являетя ли месяц длинным
  /// monthIndex [0 .. 11]
  bool isLongMonth(int monthIndex) => (monthIndex == 0 ||
      monthIndex == 2 ||
      monthIndex == 4 ||
      monthIndex == 6 ||
      monthIndex == 7 ||
      monthIndex == 9 ||
      monthIndex == 11);

  /// Проверка являетя ли месяц коротким
  /// monthIndex [0 .. 11]
  bool isShortMonth(int monthIndex) => (monthIndex == 3 ||
      monthIndex == 5 ||
      monthIndex == 8 ||
      monthIndex == 10);

  /// Проверка является ли год високосным
  bool isLeapYear(int year) =>
      ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0));

  /// Текущий индекс дня
  int dayIndex = 0;

  /// Текущий индекс месяца
  int monthIndex = 0;

  /// Текущий индекс года
  int yearIndex = 122;

  acceptDate() {
    int chosenDay = dayIndex + 1;
    int chosenMonth = monthIndex + 1;
    int chosenYear = yearIndex + 1900;
    String dateString = "$chosenDay-$chosenMonth-$chosenYear";
    var chosenDate = DateFormat('d-M-y').parse(dateString);
    widget.onDateChanged(chosenDate);
  }

  /// Строит виджеты на основе массива данных
  static List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // День
        SizedBox(
          width: 46.w,
          child: CupertinoPicker(
            itemExtent: 40.h,
            diameterRatio: 10,
            looping: false,
            useMagnifier: false,
            onSelectedItemChanged: (index) {
              /// При изменении дня меняем индекс
              setState(() => dayIndex = index);
              acceptDate();
            },

            /// Убирает UI-эффект для выбранного элемента
            selectionOverlay: Container(),
            scrollController:
                FixedExtentScrollController(initialItem: dayIndex),
            children: modelBuilder<int>(
              days,
              (index, value) {
                final isSelected = dayIndex == index;
                return Center(
                  child: Text(
                    value.toString(),
                    style: isSelected
                        ? textPrimary500Size34Black
                        : textPrimary400Size20Accent,
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          width: 35.w,
        ),
        // Месяц
        SizedBox(
          width: 148.w,
          child: CupertinoPicker(
            itemExtent: 40.h,
            diameterRatio: 10,
            looping: false,
            useMagnifier: false,
            scrollController:
                FixedExtentScrollController(initialItem: monthIndex),
            onSelectedItemChanged: (index) {
              setState(() => monthIndex = index);

              /// Если выбран февраль и год високосный
              if (monthIndex == 1 && isLeapYear(years[yearIndex])) {
                days = longFebruaryDays;
                if (dayIndex >= 29) {
                  setState(() => dayIndex = 28);
                  return;
                }

                /// Если выбран февраль и год не високосный
              } else if (monthIndex == 1 && !isLeapYear(years[yearIndex])) {
                days = shortsFebruaryDays;
                if (dayIndex >= 28) {
                  setState(() => dayIndex = 27);
                  return;
                }

                /// Если выбран длинный месяц
              } else if (isLongMonth(monthIndex)) {
                if (days.length != 31) {
                  days = longMonthDays;
                }

                /// Если выбран короткий месяц
              } else if (isShortMonth(monthIndex)) {
                if (days.length != 30) {
                  days = shortMonthDays;

                  /// Если месяц короткий, а был выбран 31 день перемащаем к 30
                  if (dayIndex == 30) {
                    setState(() => dayIndex = 29);
                    return;
                  }
                }
              }
              acceptDate();
            },
            selectionOverlay: Container(),
            children: modelBuilder<String>(
              monthsKeys,
              (index, value) {
                final isSelected = monthIndex == index;

                return Center(
                  child: TextLocale(
                    value,
                    style: isSelected
                        ? textPrimary500Size34Black
                        : textPrimary400Size20Accent,
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          width: 25.w,
        ),
        // Год
        SizedBox(
          width: 80.w,
          child: CupertinoPicker(
            scrollController:
                FixedExtentScrollController(initialItem: yearIndex),
            itemExtent: 40.h,
            diameterRatio: 10,
            looping: false,
            useMagnifier: false,
            onSelectedItemChanged: (index) {
              setState(() => yearIndex = index);

              /// Если выбран високосный год и месяц фераль
              if (isLeapYear(years[yearIndex]) && monthIndex == 1) {
                days = longFebruaryDays;

                /// Если выбрано число, которого нет в месяце
                if (dayIndex >= 28) {
                  setState(() => dayIndex = 27);
                  return;
                }

                /// Если выбран невисокосный год и месяц фераль
              } else if (!isLeapYear(years[yearIndex]) && monthIndex == 1) {
                days = shortsFebruaryDays;

                /// Если выбрано число, которого нет в месяце
                if (dayIndex >= 28) {
                  setState(() => dayIndex = 27);
                  return;
                }
              }
              acceptDate();
            },
            selectionOverlay: Container(),
            children: modelBuilder<int>(
              years,
              (index, value) {
                final isSelected = yearIndex == index;

                return Center(
                  child: Text(
                    value.toString(),
                    style: isSelected
                        ? textPrimary500Size34Black
                        : textPrimary400Size20Accent,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
