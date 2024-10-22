import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_color_scheme.dart';
import 'custom_base_theme.dart';

final class CustomDarkTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        fontFamily: GoogleFonts.abel().fontFamily,
        colorScheme: CustomColorScheme.darkColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        scaffoldBackgroundColor: const Color.fromARGB(255, 33, 26, 49),
        listTileTheme: listTileThemeData,
        bottomNavigationBarTheme: bottomNavigationBarThemeData,
        appBarTheme: appBarThemeData,
      );

  @override
  final FloatingActionButtonThemeData floatingActionButtonThemeData =
      const FloatingActionButtonThemeData();

  @override
  ElevatedButtonThemeData get elevatedButtonThemeData =>
      const ElevatedButtonThemeData();

  @override
  TextTheme get textButtonThemeData => const TextTheme();

  @override
  ListTileThemeData get listTileThemeData => ListTileThemeData(
        iconColor: CustomColorScheme.darkColorScheme.scrim,
        textColor: CustomColorScheme.darkColorScheme.scrim,
        tileColor: CustomColorScheme.darkColorScheme.surface,
        selectedTileColor: const Color.fromARGB(255, 90, 95, 224),
        selectedColor: const Color.fromARGB(255, 90, 95, 224),
      );

  @override
  BottomNavigationBarThemeData get bottomNavigationBarThemeData =>
      const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 90, 95, 224),
      );

  @override
  AppBarTheme get appBarThemeData =>
      AppBarTheme(backgroundColor: Colors.grey[700]);
}
