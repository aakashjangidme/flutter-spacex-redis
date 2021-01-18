import 'package:flutter/material.dart';

class CustomTheme {
  static CustomTheme _instance;

  CustomTheme._internal() {
    _instance = this;
  }

  factory CustomTheme() => _instance ?? CustomTheme._internal();

  static final borderRadius = BorderRadius.circular(32);

  static final roundedShape =
      RoundedRectangleBorder(borderRadius: borderRadius);
}
