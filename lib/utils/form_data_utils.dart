import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:one_trade/extensions/iterable_extension.dart';

class FormDataItem<T> {
  final String name;
  final T? value;

  /// true - записывать в FromData null значения
  /// false - нет
  final bool isUseNull;

  final FormDataContentType? contentType;

  FormDataItem({
    required this.name,
    this.value,
    bool? isUseNull,
    this.contentType,
  }) : isUseNull = isUseNull ?? false;

  @override
  String toString() {
    return 'FormDataItem(\n'
        'name: $name\n'
        'value: $value\n'
        ')';
  }
}

class FormDataContentType {
  final String type;
  final String subtype;

  FormDataContentType(
    this.type,
    this.subtype,
  );

  factory FormDataContentType.fromString(String? str) {
    final arr = str?.split('/');

    return FormDataContentType(
      arr?.elementAtOrNull(0) ?? '',
      arr?.elementAtOrNull(1) ?? '',
    );
  }
}

FormData createFormData(List<FormDataItem> items) {
  final formData = FormData();

  Object? value;

  for (FormDataItem item in items) {
    value = item.value;
    if (value == null && !item.isUseNull) {
      continue;
    }

    if (value is bool) {
      value = value ? 1 : 0; //TODO: сраный костыль бул в формдата
    }

    if (value is File) {
      formData.files.add(
        MapEntry(
          item.name,
          MultipartFile.fromFileSync(
            value.path,
            filename: value.path.split(Platform.pathSeparator).last,
            contentType: item.contentType == null
                ? null
                : MediaType(
                    item.contentType!.type,
                    item.contentType!.subtype,
                  ),
          ),
        ),
      );
      continue;
    } else if (value is Uint8List) {
      formData.files.add(
        MapEntry(
          item.name,
          MultipartFile.fromBytes(
            value,
            contentType: item.contentType == null
                ? null
                : MediaType(
                    item.contentType!.type,
                    item.contentType!.subtype,
                  ),
          ),
        ),
      );
      continue;
    }

    formData.fields.add(MapEntry(
      item.name,
      value?.toString() ?? '',
    ));
  }

  return formData;
}

/// Парсим данные [FormData] в строку
String parseFormDataToString(FormData data) {
  return [
    ...data.fields.map((e) => '${e.key} = ${e.value}'),
    ...data.files.map((e) => '${e.key} = ${_parseFormDataValueFile(e.value)}'),
  ].join('\n');
}

String _parseFormDataValueFile(dynamic value) {
  if (value == null) {
    return '';
  } else if (value is MultipartFile) {
    return value.filename ?? '';
  }

  return value.toString();
}
