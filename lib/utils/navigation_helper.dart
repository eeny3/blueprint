import 'package:flutter/widgets.dart';

//TODO подключить раутинг(временно так)
class NavigationHelper {
  void push(BuildContext context, Route<void> route) {
    Navigator.of(context).push(route);
  }

  void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
