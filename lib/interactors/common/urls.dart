import 'package:one_trade/di/di_container.dart';
import 'package:one_trade/interactors/flavor/flavor_interactor.dart';

late final baseApiUrl = getIt.get<FlavorInteractor>().currentFlavor.baseApiUrl;
