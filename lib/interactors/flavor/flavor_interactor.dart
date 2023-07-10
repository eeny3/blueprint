import 'package:injectable/injectable.dart';
import 'package:one_trade/interactors/flavor/flavor.dart';
import 'package:one_trade/interactors/flavor/flavor_service.dart';

@singleton
class FlavorInteractor implements FlavorService {
  @override
  Flavor currentFlavor;

  FlavorInteractor(
    this.currentFlavor,
  );
}
