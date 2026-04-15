import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFEF2A39);
  static const Color primaryLight = Color(0xFFFF929B);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF858585);
  static const Color black = Color(0xFF1E1E1E);
  
  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLight, primary],
  );
}
