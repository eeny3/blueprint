import 'package:one_trade/domains/login_domain/login_domain.dart';

LoginDomain mapToLoginDomain(
    String token,
    ) {
  return LoginDomain(
    token: token,
  );
}
