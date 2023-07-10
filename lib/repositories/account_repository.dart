import 'package:injectable/injectable.dart';
import 'package:one_trade/domains/login_domain/login_domain.dart';
import 'package:one_trade/domains/registration_step_domain/registration_step_domain.dart';
import 'package:one_trade/models/registration_first_step_form/registration_first_step_form.dart';
import 'package:one_trade/models/registration_second_step_form/registration_second_step_form.dart';
import 'package:one_trade/models/registration_step_response_model/resgistration_step_response_mapper.dart';
import 'package:one_trade/models/registration_third_step_form/registration_third_step_form.dart';
import 'package:one_trade/models/set_password_response_model/set_password_response_mapper.dart';
import 'package:one_trade/service/networking/client.dart';

/// Репозиторий для аккаунта
@injectable
class AccountRepository {
  final RestClient _client;

  AccountRepository(this._client);

  /// Получить данные по первому шагу регистрации
  Future<RegistrationStepDomain> executeRegistrationFirstStep(
    String phone,
  ) async {
    final response = await _client.registrationFirstStep(
      RegistrationFirstStepFormModel(
        phone: phone,
        //TODO спросить у бэка что это за поле
        message: 'user.one_time_code',
      ),
    );
    return mapToRegistrationStepDomain(
      response.id,
    );
  }

  /// Получить данные по второму шагу регистрации
  Future<void> executeRegistrationSecondStep(
    String id,
    String code,
  ) async {
    final form = RegistrationSecondStepFormModel(
      id: id,
      code: code,
    );
    await _client.registrationSecondStep(form);
  }

  /// Получить данные по третьему шагу регистрации
  Future<LoginDomain> executeRegistrationThirdStep(
    String id,
    String password,
    String username,
  ) async {
    final form = RegistrationThirdStepFormModel(
      id: id,
      password: password,
      username: username,
    );
    final response = await _client.registrationThirdStep(form);
    return mapToLoginDomain(
      response.token,
    );
  }

  //TODO переделать под новый апи
  /// Получить данные по четвертому шагу регистрации
  // Future<RegistrationStepDomain> executeRegistrationFourthStep(
  //   String phone,
  //   String jurisdiction,
  //   String firstname,
  //   String lastname,
  //   String dob,
  //   String address,
  //   String email,
  // ) async {
  //   final form = RegistrationFourthStepFormModel(
  //     phone: phone,
  //     jurisdiction: jurisdiction,
  //     firstname: firstname,
  //     lastname: lastname,
  //     dob: dob,
  //     address: address,
  //     email: email,
  //   );
  //   final response = await _client.registrationFourthStep(form);
  //   return mapToRegistrationStepDomain(
  //     response.success,
  //     response.error,
  //     response.uuid,
  //   );
  // }
}
