import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:one_trade/di/di_container.config.dart';

/// Команда для генерации:
/// flutter packages pub run build_runner watch --delete-conflicting-outputs
final getIt = GetIt.instance;

@InjectableInit()
Future<void> initDi(String flavor) async {
  await $initGetIt(
    getIt,
    environmentFilter: NoEnvOrContains(flavor),
  );
  return getIt.allReady();
}
