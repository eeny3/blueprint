import 'package:elementary/elementary.dart';
import 'package:one_trade/domains/registration_step_domain/registration_step_domain.dart';
import 'package:one_trade/service/account/account_interactor.dart';

class PhoneInputScreenModel extends ElementaryModel {
  final AccountInteractor _accountInteractor;

  PhoneInputScreenModel(ErrorHandler errorHandler, this._accountInteractor)
      : super(errorHandler: errorHandler);

  Future<RegistrationStepDomain> executeRegistrationFirstStep(
      String phone,
      ) async {
    try {
      final response = await _accountInteractor.executeRegistrationFirstStep(
        phone,
      );
      return response;
    } catch (error) {
      //TODO спросить у дизайнера как обрабатывать и добавить обработку
      handleError(error);
      rethrow;
    }
  }
}