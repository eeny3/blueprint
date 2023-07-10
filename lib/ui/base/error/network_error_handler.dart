import 'package:elementary/elementary.dart';
import 'package:one_trade/ui/base/error/error.dart';
import 'package:one_trade/utils/log_utils.dart';

///Базовый класс для обработки ошибок, связанных с сервисным слоем
abstract class NetworkErrorHandler implements ErrorHandler {
  @override
  void handleError(Object e, {StackTrace? stackTrace}) {
    debugCustomPrint(e, stackTrace);

    if (e is Error) {
      _handleError(e);
    } else if (e is ConnectionTimeOutException) {
      handleConnectionTimeOutException(e);
    } else if (e is Exception) {
      _handleException(e);
    } else {
      handleOther(e.toString());
    }
  }

  void handleNoInternetError(NoInternetException e);

  void handleConnectionTimeOutException(ConnectionTimeOutException e);

  void handleOtherException(Exception e);

  void handleOther(String e);

  void _handleException(Exception exception) {
    if (exception is NoInternetException) {
      handleNoInternetError(exception);
    } else {
      handleOtherException(exception);
    }
  }

  void _handleError(Error e) {
    //Здесь пока тупая реализация: просто выводим сообщение об ошибке + кидаем как unhandled
    handleOtherException(Exception(Error.safeToString(e)));

    throw e;
  }
}
