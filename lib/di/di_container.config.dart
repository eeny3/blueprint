// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../interactors/account/account_interactor.dart' as _i27;
import '../interactors/basket/basket_interactor.dart' as _i29;
import '../interactors/dio/dio_interactor.dart' as _i10;
import '../interactors/finance/finance_interactor.dart' as _i24;
import '../interactors/flavor/flavor.dart' as _i3;
import '../interactors/flavor/flavor_interactor.dart' as _i4;
import '../interactors/locale/locale_interactor.dart' as _i5;
import '../interactors/order/order_interactor.dart' as _i30;
import '../interactors/profile/profile_interactor.dart' as _i18;
import '../interactors/session/session_interactor.dart' as _i7;
import '../interactors/stock/stock_interactor.dart' as _i26;
import '../repositories/account_repository.dart' as _i20;
import '../repository/account/account_repository.dart' as _i21;
import '../repository/basket/basket_repository.dart' as _i23;
import '../repository/finance/finance_repository.dart' as _i12;
import '../repository/order/order_repository.dart' as _i25;
import '../repository/profile/profile_repository.dart' as _i14;
import '../repository/stock/stock_repository.dart' as _i17;
import '../service/account/account_interactor.dart' as _i28;
import '../service/networking/account_api/account_api.dart' as _i19;
import '../service/networking/basket_api/basket_api.dart' as _i22;
import '../service/networking/client.dart' as _i15;
import '../service/networking/finance_api/finance_api.dart' as _i11;
import '../service/networking/profile_api/profile_api.dart' as _i13;
import '../service/networking/stock_api/stock_api.dart' as _i16;
import '../ui/base/material_message_controller.dart' as _i6;
import '../ui/base/standard_error_handler.dart' as _i8;

const String _prod = 'prod';
const String _test = 'test';
const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final dioModule = _$DioModule();
  gh.factory<_i3.Flavor>(
    () => _i3.ProdFlavor(),
    registerFor: {_prod},
  );
  gh.factory<_i3.Flavor>(
    () => _i3.QAFlavor(),
    registerFor: {_test},
  );
  gh.factory<_i3.Flavor>(
    () => _i3.DevFlavor(),
    registerFor: {_dev},
  );
  gh.singleton<_i4.FlavorInteractor>(_i4.FlavorInteractor(get<_i3.Flavor>()));
  gh.singleton<_i5.LocaleInteractor>(_i5.LocaleInteractorImpl());
  gh.factory<_i6.MaterialMessageController>(
      () => _i6.MaterialMessageController());
  gh.lazySingleton<_i7.SessionInteractor>(() => _i7.SessionInteractor());
  gh.singleton<_i8.StandardErrorHandler>(
      _i8.StandardErrorHandler(get<_i6.MaterialMessageController>()));
  gh.lazySingleton<_i9.Dio>(() => dioModule.getDio(get<_i3.Flavor>()));
  gh.singleton<_i10.DioInteractor>(_i10.DioInteractor(get<_i9.Dio>()));
  gh.singleton<_i11.FinanceApi>(_i11.FinanceApi(get<_i9.Dio>()));
  gh.factory<_i12.FinanceRepository>(
      () => _i12.FinanceRepositoryImpl(financeApi: get<_i11.FinanceApi>()));
  gh.singleton<_i13.ProfileApi>(_i13.ProfileApi(get<_i9.Dio>()));
  gh.factory<_i14.ProfileRepository>(
      () => _i14.ProfileRepositoryImpl(get<_i13.ProfileApi>()));
  gh.singleton<_i15.RestClient>(_i15.RestClient(get<_i9.Dio>()));
  gh.singleton<_i16.StockApi>(_i16.StockApi(get<_i9.Dio>()));
  gh.factory<_i17.StockRepository>(
      () => _i17.StockRepositoryImpl(stockApi: get<_i16.StockApi>()));
  gh.lazySingleton<_i18.UserProfileInteractor>(
      () => _i18.ProfileInteractorImpl(get<_i14.ProfileRepository>()));
  gh.singleton<_i19.AccountApi>(_i19.AccountApi(get<_i9.Dio>()));
  gh.factory<_i20.AccountRepository>(
      () => _i20.AccountRepository(get<_i15.RestClient>()));
  gh.factory<_i21.AccountRepository>(
      () => _i21.AccountRepositoryImpl(accountApi: get<_i19.AccountApi>()));
  gh.singleton<_i22.BasketApi>(_i22.BasketApi(get<_i9.Dio>()));
  gh.factory<_i23.BasketRepository>(
      () => _i23.BasketRepositoryImpl(basketApi: get<_i22.BasketApi>()));
  gh.lazySingleton<_i24.FinanceInteractor>(() => _i24.FinanceInteractorImpl(
      financeRepository: get<_i12.FinanceRepository>()));
  gh.factory<_i25.OrderRepository>(
      () => _i25.OrderRepositoryImpl(accountApi: get<_i19.AccountApi>()));
  gh.lazySingleton<_i26.StockInteractor>(() =>
      _i26.StockRepositoryImpl(stockRepository: get<_i17.StockRepository>()));
  gh.lazySingleton<_i27.AccountInteractor>(() => _i27.AccountInteractorImpl(
      accountRepository: get<_i21.AccountRepository>()));
  gh.lazySingleton<_i28.AccountInteractor>(() => _i28.AccountInteractor(
        get<_i20.AccountRepository>(),
        get<_i7.SessionInteractor>(),
      ));
  gh.lazySingleton<_i29.BasketInteractor>(() => _i29.BasketInteractorImpl(
      basketRepository: get<_i23.BasketRepository>()));
  gh.lazySingleton<_i30.OrderInteractor>(() =>
      _i30.OrderInteractorImpl(orderRepository: get<_i25.OrderRepository>()));
  return get;
}

class _$DioModule extends _i10.DioModule {}
