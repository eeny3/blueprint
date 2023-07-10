import 'package:injectable/injectable.dart';
import 'package:one_trade/models/registration_first_step_form/registration_first_step_form.dart';
import 'package:one_trade/models/registration_fourth_step_form/registration_fourth_step_form.dart';
import 'package:one_trade/models/registration_second_step_form/registration_second_step_form.dart';
import 'package:one_trade/models/registration_step_response_model/registration_step_response_model.dart';
import 'package:one_trade/models/registration_third_step_form/registration_third_step_form.dart';
import 'package:one_trade/models/set_password_response_model/set_password_response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'client.g.dart';

@singleton
@RestApi()
abstract class RestClient {
  @factoryMethod
  factory RestClient(Dio dio) = _RestClient;

  @POST("/api/v3/security/otp")
  Future<RegistrationStepResponseModel> registrationFirstStep(
    @Body() RegistrationFirstStepFormModel form,
  );

  @POST("/api/v3/security/otp-use")
  Future<void> registrationSecondStep(
    @Body() RegistrationSecondStepFormModel form,
  );

  @POST("/api/v3/security/set-password")
  Future<SetPasswordResponseModel> registrationThirdStep(
    @Body() RegistrationThirdStepFormModel form,
  );

  @POST("/registration/fourth")
  Future<RegistrationStepResponseModel> registrationFourthStep(
    @Body() RegistrationFourthStepFormModel form,
  );
}
