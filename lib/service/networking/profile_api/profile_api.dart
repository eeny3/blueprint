import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:one_trade/models/profile/profile_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api.g.dart';

/// класс для запросов о профиле
@singleton
@RestApi(baseUrl: '')
abstract class ProfileApi {
  @factoryMethod
  factory ProfileApi(Dio dio) = _ProfileApi;

  /// Отправка запроса на получение информации о пользователе
  @GET('/api/v3/user/info')
  Future<UserProfileResponseModelRoot> getUserProfileInfo();

  /// Редактирование данных пользователя
  @POST('/api/v3/user/attributes')
  Future<UserProfileResponseModel> setUserProfileInfo({
    @Field('firstName') String? firstName,
    @Field('secondName') String? secondName,
    @Field('lastName') String? lastName,
    @Field('dob') String? dayOfBirth,
    // TODO: геолокация
  });

  /// Получение способов связи для пользователя, чтобы получить поддержку
  @GET('/api/v3/site-param')
  Future<ContactSiteResponseModel> getContactSites();
}
