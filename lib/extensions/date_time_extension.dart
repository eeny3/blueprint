import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime {
  String get onlyDateString {
    final date = DateUtils.dateOnly(this);
    final month = date.month;
    final day = date.day;

    return '${date.year}'
        '-'
        '${month >= 10 ? month : '0$month'}'
        '-'
        '${day >= 10 ? day : '0$day'}';
  }
}
