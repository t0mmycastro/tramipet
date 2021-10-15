import 'package:flutter/material.dart';

extension DarkModeExtension on BuildContext {
  bool get isDarkModeAlias {
    return Theme.of(this).brightness == Brightness.dark;
  }
}
