import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/provider/rockets_provider.dart';
import 'drawer_screen.dart';
import 'rockets_home.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          DrawerScreen(),
          RocketsHome(),
        ],
      ),
    );
  }
}
