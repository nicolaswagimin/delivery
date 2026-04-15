import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFF4B4B);
  static const Color primaryDark = Color(0xFFFF3D3D);
  static const Color primaryLight = Color(0xFFFF6B6B);
  static const Color background = Color(0xFFF2F2F2);
  static const Color white = Color(0xFFFFFFFF);
  static const Color greyLight = Color(0xFFE0E0E0);
  static const Color greyMedium = Color(0xFF9E9E9E);
  static const Color grey = Color(0xFF858585);
  static const Color black = Color(0xFF1E1E1E);
  static const Color textDark = Color(0xFF333333);
  static const Color textLight = Color(0xFF666666);
  static const Color success = Color(0xFF4CAF50);
  
  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFF6B6B), Color(0xFFFF3D3D)],
  );
  
  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFF4B4B), Color(0xFFFF3D3D)],
  );
}
