import 'package:flutter/material.dart';
import 'package:tesla_redis/src/core/routes/route_constants.dart';
import 'package:tesla_redis/src/ui/widgets/loading.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 1),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        RouteString.homeRoute,
        (route) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Loading(),
    );
  }
}
