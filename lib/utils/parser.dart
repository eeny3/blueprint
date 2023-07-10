/**
 * Набор парсеров данных
 */

/// парсинг в [int]
int parseInt(Object value) {
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is String) return int.parse(value);

  throw const FormatException("can't parse to int");
}

int? parseIntOrNull(Object? value) {
  if (value == null) {
    return null;
  }

  try {
    return parseInt(value);
  } on Object catch (_) {
    return null;
  }
}

/// парсинг в [double]
double parseDouble(Object value) {
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.parse(value);

  throw const FormatException("can't parse to double");
}

double? parseDoubleOrNull(Object? value) {
  if (value == null) {
    return null;
  }

  try {
    return parseDouble(value);
  } on Object catch (_) {
    return null;
  }
}
