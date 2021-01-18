import 'package:flutter/cupertino.dart';

class Global {
  Global._();
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const String appName = 'Pixie';

  static const String policy = """
By signing up, you agree to $appName's Terms of Service and Privacy Policy.""";
}
