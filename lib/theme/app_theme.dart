import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const ink = Color(0xFF101A16);
  static const inkSoft = Color(0xFF24352C);
  static const mist = Color(0xFFEEF2EE);
  static const paper = Color(0xFFF7F5F0);
  static const sand = Color(0xFFE4DDD0);
  static const teal = Color(0xFF0D6B58);
  static const tealDeep = Color(0xFF084C3F);
  static const coral = Color(0xFFC45334);
  static const muted = Color(0xFF66756D);
  static const line = Color(0x1A14201A);
}

class AppTheme {
  static ThemeData get light {
    final display = GoogleFonts.fraunces(
      color: AppColors.ink,
      fontWeight: FontWeight.w600,
      height: 1.02,
      letterSpacing: -1.1,
    );
    final body = GoogleFonts.dmSans(
      color: AppColors.inkSoft,
      height: 1.55,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.paper,
      colorScheme: const ColorScheme.light(
        primary: AppColors.teal,
        onPrimary: AppColors.paper,
        secondary: AppColors.coral,
        surface: AppColors.paper,
        onSurface: AppColors.ink,
      ),
      textTheme: TextTheme(
        displayLarge: display.copyWith(fontSize: 72),
        displayMedium: display.copyWith(fontSize: 52),
        displaySmall: display.copyWith(fontSize: 40),
        headlineMedium: display.copyWith(fontSize: 30, letterSpacing: -0.6),
        headlineSmall: display.copyWith(fontSize: 24, letterSpacing: -0.4),
        titleLarge: body.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
        ),
        titleMedium: body.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
        ),
        bodyLarge: body.copyWith(fontSize: 17),
        bodyMedium: body.copyWith(fontSize: 15),
        bodySmall: body.copyWith(fontSize: 13, color: AppColors.muted),
        labelLarge: body.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}
