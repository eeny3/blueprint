import 'package:get_it/get_it.dart';
import 'package:one_trade/di/di_container.dart';
import 'package:one_trade/ui/base/standard_error_handler.dart';

T inject<T extends Object>() {
  return GetIt.I.get<T>();
}

late final standardErrorHandler = getIt.get<StandardErrorHandler>();
