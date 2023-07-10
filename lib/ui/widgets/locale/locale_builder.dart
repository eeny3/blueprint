import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/interactors/locale/locale_interactor.dart';

typedef LocaleBuilderCallback = Widget Function(
  BuildContext context,
  LocaleTextCallback getText,
);

/// Виджет перестраивающий UI при изменении локали
/// С предоставлением ссылки на лоакль
class LocaleBuilder extends StatelessWidget {
  final LocaleBuilderCallback builder;

  const LocaleBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder(
      listenableState: localeInteractor.localeState,
      builder: (_, __) => builder(context, localeInteractor.getText),
    );
  }
}
