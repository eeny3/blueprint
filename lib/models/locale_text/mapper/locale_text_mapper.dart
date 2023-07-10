import 'package:one_trade/domain/locale_text_domain.dart';
import 'package:one_trade/models/locale_text/locale_text_response_model.dart';

LocaleTextDomain mapToLocaleText(LocaleTextResponseModel model) => LocaleTextDomain(
  language: model.language,
  shortDescription: model.shortDescription,
  longDescription: model.longDescription,
);