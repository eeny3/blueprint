import 'package:elementary/elementary.dart';
import 'package:one_trade/domains/login_domain/login_domain.dart';
import 'package:one_trade/service/account/account_interactor.dart';

class PasswordInputScreenModel extends ElementaryModel {
  final AccountInteractor _accountInteractor;

  PasswordInputScreenModel(this._accountInteractor);

  Future<LoginDomain> executeRegistrationThirdStep(
      String id,
      String password,
      String username,
      ) async {
    try {
      final response = await _accountInteractor.executeRegistrationThirdStep(
        id,
        password,
        username,
      );
      return response;
    } catch (error) {
      handleError(error);
      //TODO обсудить обработку ошибок
      rethrow;
    }
  }
}