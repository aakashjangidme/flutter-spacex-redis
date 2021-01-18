import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tesla_redis/src/core/services/storage_service.dart';

import 'src/app.dart';
import 'src/core/provider/theme_notifier.dart';
import 'src/locator.dart';
import 'src/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();
  setupLogger();
  await setupLocator();

  //
  runZoned(
    () => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeNotifier>(
            lazy: false,
            create: (_) => ThemeNotifier(),
          ),
        ],
        child: App(),
      ),
    ),
    onError: (e) {
      //crashlytics
    },
  );
}
