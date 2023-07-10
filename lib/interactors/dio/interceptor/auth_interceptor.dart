import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:one_trade/interactors/session/session_interactor.dart';

const _authorizationHeader = 'Authorization';

class AuthInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final sessionService = GetIt.I<SessionInteractor>();
    if (sessionService.sessionToken != null) {
      options.headers[_authorizationHeader] = sessionService.sessionToken;
    }

    super.onRequest(options, handler);
  }
}