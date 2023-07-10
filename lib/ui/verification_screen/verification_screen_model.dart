import 'package:elementary/elementary.dart';
import 'package:one_trade/domains/registration_step_domain/registration_step_domain.dart';
import 'package:one_trade/service/account/account_interactor.dart';

class VerificationScreenModel extends ElementaryModel {
  final AccountInteractor _accountInteractor;

  VerificationScreenModel(ErrorHandler errorHandler, this._accountInteractor)
      : super(errorHandler: errorHandler);

  /// Верифицировать код
  Future<void> verifyCode(
    String id,
    String code,
  ) async {
    try {
      await _accountInteractor.executeRegistrationSecondStep(
        id,
        code,
      );
    } catch (error) {
      handleError(error);
      rethrow;
    }
  }

  /// Запросить код
  Future<RegistrationStepDomain?> requestCode(
    String phone,
  ) async {
    try {
      final response = await _accountInteractor.executeRegistrationFirstStep(
        phone,
      );
      return response;
    } catch (error) {
      handleError(error);
    }
  }
}
