import 'package:flutter/foundation.dart';

const _maxStringLength = 980;

/// Логирование большого текста
void logPrint(Object? obj) {
  if (obj == null) {
    return;
  }
  final text = obj.toString();
  if (text.length < _maxStringLength) {
    debugPrint(text);
  } else {
    final double countSections = text.length / _maxStringLength;
    final intValue = countSections.toInt();

    for (int i = 0; i < intValue; i++) {
      debugPrint(
        text.substring(
          i * _maxStringLength,
          (i + 1) * _maxStringLength,
        ),
        wrapWidth: _maxStringLength,
      );
    }
    debugPrint(text.substring(intValue * _maxStringLength));
  }
}

void debugCustomPrint(
  Object e, [
  StackTrace? stackTrace,
]) {
  debugPrint(e.toString());
  debugPrintStack(stackTrace: stackTrace);
}
