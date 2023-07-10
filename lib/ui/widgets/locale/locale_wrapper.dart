import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/interactors/locale/locale_interactor.dart';

/// Виджет перестраивающий UI при изменении локали
class LocaleWrapper extends StatelessWidget {
  final Widget Function(BuildContext context) builder;

  const LocaleWrapper({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder(
      listenableState: localeInteractor.localeState,
      builder: (_, __) => builder(context),
    );
  }
}
