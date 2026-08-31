import 'package:flutter/material.dart';

class AppColors {

  static const Color primary = Color(0xFF0284C7); 
  static const Color primaryDark = Color(0xFF0369A1); 
  static const Color primaryLight = Color(0xFF38BDF8); 
  static const Color primaryUltraLight = Color(0xFFE0F2FE); 
  static const Color primaryGradientStart = Color(0xFF38BDF8); 
  static const Color primaryGradientEnd = Color(0xFF0284C7); 


  static const Color secondary = Color(0xFF0EA5E9); 
  static const Color accentIndigo = Color(0xFF6366F1); 
  static const Color accentRose = Color(0xFFF43F5E); 
  static const Color accentEmerald = Color(0xFF10B981); 
  static const Color accentAmber = Color(0xFFF59E0B); 


  static const Color background = Color(0xFFF0F7FF); 
  static const Color surface = Color(0xFFFFFFFF); 
  static const Color surfaceSubtle = Color(0xFFF8FAFC); 
  static const Color cardBorder = Color(0xFFBAE6FD); 
  static const Color dividerColor = Color(0xFFE2E8F0); 


  static const Color textPrimary = Color(0xFF0F172A); 
  static const Color textSecondary = Color(0xFF475569); 
  static const Color textMuted = Color(0xFF94A3B8); 


  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFE0F2FE), 
      Color(0xFFF0F9FF), 
      Color(0xFFEBF4FF), 
    ],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFF8FAFC),
    ],
  );

  static const LinearGradient headerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF38BDF8),
      Color(0xFF0284C7),
    ],
  );

  static const LinearGradient avatarBorderGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF38BDF8),
      Color(0xFF60A5FA),
      Color(0xFF818CF8),
    ],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF0284C7),
      Color(0xFF0EA5E9),
    ],
  );
}
