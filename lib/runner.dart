import 'dart:async';
import 'package:flutter/material.dart';
import 'package:one_trade/di/di_container.dart';
import 'package:one_trade/interactors/locale/locale_interactor.dart';
import 'package:one_trade/ui/app/app.dart';
import 'package:one_trade/utils/log_utils.dart';

Future<void> startAppWithFlavor(String flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();

  runZonedGuarded(
    () async {
      await initDi(flavor);
      await localeInteractor.init();

      runApp(const App());
    },
    (Object error, StackTrace stack) {
      debugCustomPrint(error, stack);
    },
    // FirebaseCrashlytics.instance.recordError,
  );
}
