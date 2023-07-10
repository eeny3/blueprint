import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:one_trade/di/di_container.dart';
import 'package:one_trade/service/account/account_interactor.dart';
import 'package:one_trade/utils/inject.dart';
import 'app_model.dart';
import 'app.dart';

abstract class IAppWidgetModel extends IWidgetModel {
  bool get isAuthenticated;

  ListenableState<EntityState<ConnectivityResult>> get connectivityResult;
}

AppWidgetModel defaultAppWidgetModelFactory(BuildContext context) {
  return AppWidgetModel(
    AppModel(
      standardErrorHandler,
      getIt<AccountInteractor>(),
    ),
  );
}

// TODO: cover with documentation
/// Default widget model for AppWidget
class AppWidgetModel extends WidgetModel<App, AppModel>
    implements IAppWidgetModel {
  AppWidgetModel(AppModel model) : super(model);

  @override
  bool get isAuthenticated => model.isAuthenticated;

  final _connectivityResult = EntityStateNotifier<ConnectivityResult>();

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    // TODO временный переход
    // Future.delayed(Duration(seconds: 3), () {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => PortfolioScreen()));
    // });

    Connectivity().onConnectivityChanged.listen(_connectivityListener);
  }

  @override
  ListenableState<EntityState<ConnectivityResult>> get connectivityResult =>
      _connectivityResult;

  void _connectivityListener(ConnectivityResult event) {
    _connectivityResult.content(event);
  }
}
