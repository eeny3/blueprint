import 'package:elementary/elementary.dart';
import 'package:one_trade/service/account/account_interactor.dart';
import 'package:one_trade/utils/inject.dart';

// TODO: cover with documentation
/// Default Elementary model for App module
class AppModel extends ElementaryModel {
  final AccountInteractor _accountInteractor;

  AppModel(ErrorHandler errorHandler, this._accountInteractor)
      : super(errorHandler: errorHandler);

  bool get isAuthenticated {
    return _accountInteractor.isAuthenticated;
  }
}
