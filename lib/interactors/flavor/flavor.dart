import 'package:injectable/injectable.dart';
import 'package:one_trade/interactors/flavor/base_flavor.dart';

String devBaseApiUrl = 'https://api.merostm.com';

class Flavor implements BaseFlavor {
  @override
  final String baseApiUrl;
  @override
  final bool enableAnalytics;
  @override
  final bool enableCrashLogCollecting;
  @override
  final bool enableLogging;
  @override
  final bool isShowErrorModal;
  @override
  final String name;

  Flavor({
    required this.baseApiUrl,
    required this.name,
    this.enableAnalytics = false,
    this.enableCrashLogCollecting = false,
    this.isShowErrorModal = true,
    this.enableLogging = true,
  });
}

//@Environment("prod")
@Injectable(
  as: Flavor,
  env: [Environment.prod],
)
class ProdFlavor extends Flavor {
  ProdFlavor()
      : super(
          name: Environment.prod,
          enableAnalytics: true,
          enableCrashLogCollecting: true,
          enableLogging: false,
          isShowErrorModal: false,
          baseApiUrl: 'https://api.merostm.com',
        );
}

// Соответствует Test из задачи, однако test нельзя использовать как имся флейвора в андроиде
// - поэтому придумал такое - можем поменять
//@Environment("test")
@Injectable(
  as: Flavor,
  env: [Environment.test],
)
class QAFlavor extends Flavor {
  QAFlavor()
      : super(
          name: Environment.test,
          enableAnalytics: false,
          enableCrashLogCollecting: true,
          enableLogging: true,
          baseApiUrl: 'https://api.devmtm.xyz',
        );
}

//@Environment("dev")
@Injectable(
  as: Flavor,
  env: [Environment.dev],
)
class DevFlavor extends Flavor {
  DevFlavor()
      : super(
          name: Environment.dev,
          enableAnalytics: false,
          enableCrashLogCollecting: false,
          enableLogging: true,
          baseApiUrl: devBaseApiUrl,
        );
}
