import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/services/storage_util.dart';
import 'src/app.dart';
import 'src/core/config/theme/theme_notifier.dart';
import 'src/locator.dart';
import 'src/logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();
  setupLogger();
  await setupLocator();
  runZoned(
    () => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
            lazy: false, create: (_) => ThemeNotifier()),
      ],
      child: App(),
    )),
    onError: (e) {
      //crashlytics
    },
  );
}

