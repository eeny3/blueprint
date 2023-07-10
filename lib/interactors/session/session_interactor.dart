import 'package:injectable/injectable.dart';

@lazySingleton
class SessionInteractor {

  String? sessionToken;

  SessionInteractor();

  void clear() {
    sessionToken = null;
  }

  void update(String sessionToken) {
    sessionToken = sessionToken;
  }
}