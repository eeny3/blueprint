import 'dart:io';

import 'package:dio/dio.dart';
import 'package:one_trade/interactors/dio/status_mapper.dart';
import 'package:one_trade/ui/base/error/error.dart';

const _timeoutErrorTypes = [
  DioErrorType.connectTimeout,
  DioErrorType.receiveTimeout,
  DioErrorType.sendTimeout,
];

/// Интерцептор для обработки ошибки старой версии приложения
class ExceptionInterceptor extends Interceptor {
  final _statusMapper = StatusMapper();

  @override
  void onError(
    DioError e,
    ErrorInterceptorHandler handler,
  ) {
    if (_timeoutErrorTypes.contains(e.type)) {
      handler.next(ConnectionTimeOutException(e.response));
    } else if (e.type == DioErrorType.other && e.error is SocketException) {
      handler.next(NoInternetException(e.response));
    } else {
      _handleCustomServerError(e, handler);
    }
  }

  void _handleCustomServerError(DioError e, ErrorInterceptorHandler handler) {
    final exception = _statusMapper.getException(e.response);

    handler.next(exception);
  }
}
