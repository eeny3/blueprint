import 'package:elementary/elementary.dart';
import 'package:one_trade/domains/registration_step_domain/registration_step_domain.dart';
import 'package:one_trade/service/account/account_interactor.dart';

class ProfileInfoInputScreenModel extends ElementaryModel {
  final AccountInteractor _accountInteractor;

  ProfileInfoInputScreenModel(this._accountInteractor);

  //TODO переделать под новый апи
  // Future<RegistrationStepDomain> executeRegistrationFourthStep(
  //   String phone,
  //   String jurisdiction,
  //   String firstname,
  //   String lastname,
  //   String dob,
  //   String address,
  //   String email,
  // ) async {
  //   try {
  //     final response = await _accountInteractor.executeRegistrationFourthStep(
  //       phone,
  //       jurisdiction,
  //       firstname,
  //       lastname,
  //       dob,
  //       address,
  //       email,
  //     );
  //     return response;
  //   } catch (error) {
  //     handleError(error);
  //     rethrow;
  //   }
  // }
}
