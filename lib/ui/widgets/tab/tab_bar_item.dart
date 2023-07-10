import 'package:flutter/material.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

class TabBarItem extends StatelessWidget {
  const TabBarItem({
    Key? key,
    required this.onTab,
    this.width,
    this.label = '',
    this.isActive = false,
  }) : super(key: key);

  final void Function() onTab;
  final double? width;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Align(
        alignment: Alignment(1, 0),
        child: Container(
          width: width,
          color: Colors.transparent,
          alignment: Alignment.center,
          child: TextLocale(
            'investments',
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
