import 'package:injectable/injectable.dart';
import 'package:one_trade/domains/login_domain/login_domain.dart';
import 'package:one_trade/domains/registration_step_domain/registration_step_domain.dart';
import 'package:one_trade/interactors/session/session_interactor.dart';
import 'package:one_trade/repositories/account_repository.dart';

/// Интерактор для аккаунта
@LazySingleton()
class AccountInteractor {
  final AccountRepository _accountRepository;
  final SessionInteractor _sessionInteractor;

  AccountInteractor(
      this._accountRepository,
      this._sessionInteractor,
      );

  /// Первый шаг регистрарции
  Future<RegistrationStepDomain> executeRegistrationFirstStep(
      String phone,
      ) async {
    return await _accountRepository.executeRegistrationFirstStep(
      phone,
    );
  }

  /// Второй шаг регистрарции
  Future<void> executeRegistrationSecondStep(
      String id,
      String code,
      ) async {
    await _accountRepository.executeRegistrationSecondStep(
      id,
      code,
    );
  }

  /// Третий шаг регистрарции
  Future<LoginDomain> executeRegistrationThirdStep(
      String id,
      String password,
      String username,
      ) async {
    final domain = await _accountRepository.executeRegistrationThirdStep(
      id,
      password,
      username,
    );
    _sessionInteractor.update(domain.token);
    return domain;
  }

  //TODO переделать под новый апи
  // /// Четвертый шаг регистрарции
  // Future<RegistrationStepDomain> executeRegistrationFourthStep(
  //   String phone,
  //   String jurisdiction,
  //   String firstname,
  //   String lastname,
  //   String dob,
  //   String address,
  //   String email,
  // ) async {
  //   return await _accountRepository.executeRegistrationFourthStep(
  //     phone,
  //     jurisdiction,
  //     firstname,
  //     lastname,
  //     dob,
  //     address,
  //     email,
  //   );
  // }

  bool get isAuthenticated {
    //TODO реализовать
    return false;
  }

  Future<bool> checkIfNew() async {
    //TODO реализовать
    await Future.delayed(const Duration(seconds: 1), () {});
    return true;
  }
}

