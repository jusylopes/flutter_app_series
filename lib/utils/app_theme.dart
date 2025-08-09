import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  final Color seedColor;
  late final ColorScheme colorSchemeLight;
  late final ColorScheme colorSchemeDark;
  late final ThemeData lightTheme;
  late final ThemeData darkTheme;

  AppTheme({required this.seedColor}) {
    colorSchemeLight = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.light,
    );
    colorSchemeDark = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
    );

    lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: colorSchemeLight,
      fontFamily: GoogleFonts.roboto().fontFamily,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: colorSchemeLight.primary,
        titleTextStyle: GoogleFonts.lobster(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: colorSchemeLight.onPrimary,
        ),
        iconTheme: IconThemeData(color: colorSchemeLight.onPrimary, size: 36),
      ),
      cardTheme: CardTheme(
        color: colorSchemeLight.secondaryContainer,
        shadowColor: colorSchemeLight.onSurface,
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );

    darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: colorSchemeDark,
      fontFamily: GoogleFonts.roboto().fontFamily,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: colorSchemeDark.primary,
        titleTextStyle: GoogleFonts.lobster(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: colorSchemeDark.onPrimary,
        ),
        iconTheme: IconThemeData(color: colorSchemeDark.onPrimary, size: 36),
      ),
      cardTheme: CardTheme(
        color: colorSchemeDark.secondaryContainer,
        shadowColor: colorSchemeDark.onSurface,
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
