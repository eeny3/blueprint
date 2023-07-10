import 'package:intl/intl.dart';
import 'package:one_trade/models/profile/profile_response_model.dart';
import 'package:one_trade/domain/user_profile_domain.dart';

UserProfileDomain mapToUserProfile(UserProfileResponseModel model) {
  String formattedDob;
  if (model.dob == null) {
    formattedDob = '';
  }
  DateTime dob = DateTime.parse(model.dob!);
  formattedDob = DateFormat('dd.MM.yyyy').format(dob);
  return UserProfileDomain(
    lastName: model.lastName,
    firstName: model.firstName,
    secondName: model.secondName,
    dayOfBirth: formattedDob,
    phone: model.phone,
    isUserVerified: model.verified,
  );
}

ContactSites mapToContactSites(ContactSiteResponseModel model) => ContactSites(
      phone: model.phone,
      email: model.email,
      telegram: model.telegram,
    );
