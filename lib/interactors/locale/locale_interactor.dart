import 'dart:convert';

import 'package:elementary/elementary.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:one_trade/di/di_container.dart';
import 'package:one_trade/interactors/locale/lang_code.dart';

typedef LocaleData = Map<String, dynamic>;
typedef LocaleTextCallback = String Function(
  String key, {
  Map<String, String>? namedArgs,
});

late final localeInteractor = getIt.get<LocaleInteractor>();

String getLocaleString(
  String key, {
  Map<String, String>? namedArgs,
}) =>
    localeInteractor.getText(key, namedArgs: namedArgs);

abstract class LocaleInteractor {
  abstract final StateNotifier<LocaleData> localeState;

  Future<void> init();

  Future<void> load(LangCode langCode);

  String getText(
    String key, {
    Map<String, String>? namedArgs,
  });

  void setLocaleTextData(Map<String, dynamic> newData);
}

/// Интераткор локализации
@Singleton(as: LocaleInteractor)
class LocaleInteractorImpl implements LocaleInteractor {
  /// Состояние локализации
  @override
  final localeState = StateNotifier<LocaleData>(initValue: {});

  Map<String, dynamic> get _localeTextData => localeState.value ?? {};

  late final LangCode _initLangCode = LangCode.ru;

  @override
  Future<void> init() => load(_initLangCode);

  @override
  Future<void> load(LangCode langCode) async {
    String jsonContent = await rootBundle
        .loadString('assets/locale/localization_${langCode.value}.json');

    setLocaleTextData(json.decode(jsonContent));
  }

  /// Получить текст из локализации
  @override
  String getText(
    String key, {
    Map<String, String>? namedArgs,
  }) =>
      _replaceNamedArgs(_localeTextData[key] ?? key, namedArgs);

  /// Установить новую дату локализации
  @override
  void setLocaleTextData(Map<String, dynamic> newData) {
    localeState.accept(newData);
  }

  String _replaceNamedArgs(String res, Map<String, String>? args) {
    if (args == null || args.isEmpty) return res;
    args.forEach((String key, String value) =>
        res = res.replaceAll(RegExp('{$key}'), value));
    return res;
  }
}
