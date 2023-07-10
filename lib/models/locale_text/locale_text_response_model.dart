import 'package:json_annotation/json_annotation.dart';

part 'locale_text_response_model.g.dart';

/// Модель ответа запроса текста с локализации с бэка
@JsonSerializable()
class LocaleTextResponseModel {
  String? language;
  String? shortDescription;
  String? longDescription;

  LocaleTextResponseModel({
    this.language,
    this.shortDescription,
    this.longDescription,
  });

  factory LocaleTextResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LocaleTextResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LocaleTextResponseModelToJson(this);
  }
}
