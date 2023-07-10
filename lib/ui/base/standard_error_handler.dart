import 'package:injectable/injectable.dart';
import 'package:one_trade/ui/base/error/error.dart';
import 'package:one_trade/ui/base/error/network_error_handler.dart';
import 'package:one_trade/ui/base/material_message_controller.dart';

/// Стандартная реализация ErrorHandler
@singleton
class StandardErrorHandler extends NetworkErrorHandler {
  final MaterialMessageController? _messageController;

  StandardErrorHandler(
    this._messageController,
  );

  @override
  void handleOtherException(Exception e) {
    if (e is BaseException) {
      _show(e.message);
    } else {
      /// TODO переделать с учетом локализации
      _show('Ошибка');
    }
  }

  @override
  void handleNoInternetError(NoInternetException e) {
    /// TODO переделать с учетом локализации
    _show('Не соединения с интернетом');
  }

  @override
  void handleConnectionTimeOutException(ConnectionTimeOutException e) {
    /// TODO переделать с учетом локализации
    _show('Истекло время ожидания подключения');
  }

  @override
  void handleOther(String e) {
    _show(e);
  }

  void _show(String text) {
    _messageController?.showError(text);
  }
}
