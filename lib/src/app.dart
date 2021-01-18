import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/config/theme/app_theme.dart';
import 'core/config/theme/theme_notifier.dart';
import 'core/routes/index.dart';
import 'core/routes/route_constants.dart';
import 'globals.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (_, appState, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Global.appName,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appState.darkMode ? ThemeMode.dark : ThemeMode.light,
          onGenerateRoute: routes,
          initialRoute: RouteString.initialRoute,
        );
      },
    );
  }
}
