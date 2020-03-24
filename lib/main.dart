import 'package:flutter/material.dart';
import 'package:px/common/config/injector.dart';
import 'package:px/common/config/log_config.dart';

import 'app.dart' as app;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup injections & Logger here
  await setupInjections();
  setupLogger();
  app.main();
}
