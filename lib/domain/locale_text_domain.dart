import 'package:json_annotation/json_annotation.dart';
import 'package:one_trade/resources/strings/common_strings.dart';

/// Доменная модель текста с локализации с бэка
class LocaleTextDomain {
  final String language;
  final String shortDescription;
  final String longDescription;

  LocaleTextDomain({
    String? language,
    String? shortDescription,
    String? longDescription,
  })  : language = language ?? emptyString,
        shortDescription = shortDescription ?? emptyString,
        longDescription = longDescription ?? emptyString;
}
