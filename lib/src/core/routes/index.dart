import 'package:flutter/material.dart';
import '../../ui/home/home_screen.dart';
import '../../ui/splash_screen.dart';

import 'route_constants.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case RouteString.initialRoute:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case RouteString.homeRoute:
      return MaterialPageRoute(builder: (_) => HomeScreen());

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
