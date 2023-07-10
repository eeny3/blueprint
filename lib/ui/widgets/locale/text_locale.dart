import 'package:flutter/material.dart';
import 'package:one_trade/ui/widgets/locale/locale_builder.dart';

/// Искать локальзацию по контексту
/// Этот виджет оставить для приема ключей
/// Минимизировать использование TextLocale
///
/// Текст с локализацией
class TextLocale extends StatelessWidget {
  final String keyName;

  final InlineSpan? textSpan;

  final Map<String, String>? namedArgs;

  final TextStyle? style;

  final TextAlign? textAlign;

  final TextOverflow? overflow;

  final int? maxLines;

  final double? textScaleFactor;

  const TextLocale(
    this.keyName, {
    Key? key,
    this.namedArgs,
    this.textSpan,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.textScaleFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (_, getText) => Text(
        getText(keyName, namedArgs: namedArgs),
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
      ),
    );
  }
}
