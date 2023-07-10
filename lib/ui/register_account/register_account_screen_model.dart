import 'package:elementary/elementary.dart';
import 'package:one_trade/domain/account_domain.dart';
import 'package:one_trade/interactors/account/account_interactor.dart';

/// Имплементация Elementary модели к регистрации счета
class RegisterAccountScreenModel extends ElementaryModel {
  final AccountInteractor _accountInteractor;

  RegisterAccountScreenModel(
    ErrorHandler errorHandler,
    this._accountInteractor,
  ) : super(errorHandler: errorHandler);

  Future<AccountDomain?> createAccount({
    required String accountName,
  }) =>
      _accountInteractor.createAccount(
        accountName: accountName,
      );
}
