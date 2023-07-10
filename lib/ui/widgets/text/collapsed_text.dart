import 'package:flutter/material.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Виджет текста с скрытым контентом "показать все"
class CollapsedText extends StatefulWidget {
  const CollapsedText({
    Key? key,
    required this.shortText,
    required this.text,
    this.textStyle,
  }) : super(key: key);

  final String shortText;
  final String text;
  final TextStyle? textStyle;

  @override
  State<CollapsedText> createState() => _CollapsedTextState();
}

class _CollapsedTextState extends State<CollapsedText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isExpanded
              ? widget.text
              : widget.shortText,
          style: widget.textStyle ?? textBold500Size16Grey2,
        ),
        if (!isExpanded)
          GestureDetector(
            onTap: expand,
            child: TextLocale(
              'expand',
              style: textPrimary500Size16Primary,
            ),
          ),
      ],
    );
  }

  void expand() => setState(() => isExpanded = true);
}
