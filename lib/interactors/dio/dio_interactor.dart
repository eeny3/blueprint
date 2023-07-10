import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:one_trade/interactors/common/urls.dart';
import 'package:one_trade/interactors/dio/interceptor/custom_log_interceptor.dart';
import 'package:one_trade/interactors/dio/interceptor/exception_interceptor.dart';
import 'package:one_trade/interactors/flavor/flavor.dart';
import 'package:one_trade/interactors/dio/interceptor/auth_interceptor.dart';

const _timeout = 30;

@module
abstract class DioModule {
  @lazySingleton
  Dio getDio(
    Flavor flavor,
  ) =>
      Dio()
        ..options.baseUrl = flavor.baseApiUrl
        // здесь позже так же можно будет добавить auth interceptor или логирование
        ..options.headers['accept'] = 'application/json'

        /// TODO сделать изменяемым для отправки разных данных
        ..options.headers['Content-Type'] = 'application/json'
        ..options.connectTimeout =
            const Duration(seconds: _timeout).inMilliseconds
        ..options.sendTimeout = const Duration(seconds: _timeout).inMilliseconds
        ..options.receiveTimeout =
            const Duration(seconds: _timeout).inMilliseconds
        ..interceptors.addAll(
          [
            AuthInterceptor(),
            CustomLogInterceptor(
              requestBody: true,
              responseBody: true,
            ),
            ExceptionInterceptor(),
          ],
        );
}

@singleton
class DioInteractor {
  final Dio dio;

  DioInteractor(Dio this.dio);

  Future<Response<Map<String, dynamic>>> fetch({
    required String url,
    required String method,
    ResponseType responseType = ResponseType.json,
    FormData? data,
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.fetch<Map<String, dynamic>>(
      Options(
        method: method,
        responseType: ResponseType.json,
        contentType: 'multipart/form-data',
      )
          .compose(
            dio.options,
            url,
            data: data,
            queryParameters: queryParameters,
          )
          .copyWith(baseUrl: baseApiUrl),
    );
  }
}
