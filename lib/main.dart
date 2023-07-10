import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:one_trade/runner.dart';

// Main функция все равно должна быть и здесь, несмотря на флейворы, так как апп центр иначе будет на это ругаться
// (в данный момент апп центр флаттер официально не поддерживает и флаттер там собирается через кастомные билд скрипты)
Future<void> main() async {
  await startAppWithFlavor(Environment.dev);
}
