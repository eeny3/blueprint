import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:one_trade/ui/base/message_controller/message_controller.dart';

///Стандартная реализация [MessageController]
@injectable
class MaterialMessageController implements MessageController {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void show(SnackBar snackBar) {
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  /// TODO реализовать вывод снеков
  @override
  void showError(String text) {
    //show(SnackBarBuilder.buildError(text));
  }

  @override
  void showInfo(String text) {
    // show(SnackBarBuilder.buildInfo(text));
  }

  @override
  void showSuccessful(String text) {
    // show(SnackBarBuilder.buildSuccessful(text));
  }

  @override
  void showConfirmationInfo(String text) {
    // show(SnackBarBuilder.buildConfirmationInfo(text));
  }

  @override
  void showConfirmationSuccessful(String text) {
    // show(SnackBarBuilder.buildConfirmationSuccessful(text));
  }
}
