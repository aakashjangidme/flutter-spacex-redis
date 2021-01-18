import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Utils Singleton!
class Utils {
  static Utils _instance;

  Utils._internal() {
    _instance = this;
  }

  factory Utils() => _instance ?? Utils._internal();

  static String initialMethod(String name) {
    try {
      var names =
          name.trim().replaceAll(RegExp(r'[\W]'), '').toUpperCase().split(' ');
      names.retainWhere((s) => s.trim().isNotEmpty);
      if (names.length >= 2) {
        return names.elementAt(0)[0] + names.elementAt(1)[0];
      } else if (names.elementAt(0).length >= 2) {
        return names.elementAt(0).substring(0, 2);
      } else {
        return names.elementAt(0)[0];
      }
    } catch (e) {
      return '?';
    }
  }

  static void toast(String message) {
    Fluttertoast.showToast(
      msg: message,
      // backgroundColor: .withOpacity(0.95),
      textColor: Colors.black,
    );
  }

  static void internetLookUp() {
    try {
      InternetAddress.lookup('example.com').catchError((e) {
        Utils.toast('No internet connection.');
      });
    } catch (_) {
      Utils.toast('No internet connection.');
    }
  }


}
