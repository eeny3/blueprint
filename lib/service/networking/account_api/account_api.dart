import 'package:injectable/injectable.dart';
import 'package:one_trade/models/account/account_response_model.dart';
import 'package:one_trade/models/last_past_actual/last_past_actual_response_model.dart';
import 'package:one_trade/models/order/order_response_model.dart';
import 'package:one_trade/models/stock_response/stock_response_model.dart';
import 'package:one_trade/models/user_accounts_response/user_accounts_response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'account_api.g.dart';

/// класс для запросов счетов
@singleton
@RestApi(baseUrl: '')
abstract class AccountApi {
  @factoryMethod
  factory AccountApi(Dio dio) = _AccountApi;

  /// Отправка запроса получение всех счетов пользователя
  @GET('/api/v3/account')
  Future<UserAccountsResponseModel> getUserAccounts();

  /// Отправка запроса на открытие счета
  @POST('/api/v3/account/create')
  Future<AccountResponseModel> createAccount({
    @Field('customName') required String customName,
  });


  /// Отправка запроса на получение партнерских коммисии по счету
  //TODO put Future response model
  @POST('/api/v3/commission/accounts/{id}')
  Future<dynamic> getPartnerCommissionByAccount({
    @Path('id') required int id,
    @Query('page') required int page,
    @Query('limit') int limit = 10,
    @Field('customName') required String customName,
  });

  /// Отправка запроса на редактирование счета пользователя
  @POST('/api/v3/account/update/{login}')
  Future<AccountResponseModel> updateAccount({
    @Path('login') required String login,
    @Field('customName') required String customName,
  });

  /// Отправка запроса на получение открытых заказов ipo пользователя
  @GET('/api/v3/order/opened/{login}')
  Future<List<OrderResponseModel>> getOpenedOrders({
    @Path('login') required int login,
  });

  /// Отправка запроса на получение завершенных заказов ipo пользователя
  @GET('/api/v3/order/closed/{login}')
  Future<List<OrderResponseModel>> getClosedOrders({
    @Path('login') required int login,
  });
}
