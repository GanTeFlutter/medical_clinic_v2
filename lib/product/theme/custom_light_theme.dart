import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_color_scheme.dart';
import 'custom_base_theme.dart';

final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        fontFamily: GoogleFonts.abel().fontFamily,
        colorScheme: CustomColorScheme.lightColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        scaffoldBackgroundColor: Colors.white,
        listTileTheme: listTileThemeData,
        bottomNavigationBarTheme: bottomNavigationBarThemeData,
        appBarTheme: appBarThemeData,
      );

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      const FloatingActionButtonThemeData();

  @override
  ElevatedButtonThemeData get elevatedButtonThemeData =>
      const ElevatedButtonThemeData();

  @override
  TextTheme get textButtonThemeData => const TextTheme();

  @override
  ListTileThemeData get listTileThemeData => ListTileThemeData(
        iconColor: CustomColorScheme.lightColorScheme.onSurface,
        textColor: CustomColorScheme.lightColorScheme.onSurface,
        tileColor: CustomColorScheme.lightColorScheme.surface,
        selectedTileColor: CustomColorScheme.lightColorScheme.primary,
      );

  @override
  BottomNavigationBarThemeData get bottomNavigationBarThemeData =>
      const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 225, 227, 255),
          selectedItemColor: Color.fromARGB(255, 25, 63, 255));

  @override
  AppBarTheme get appBarThemeData =>
      AppBarTheme(backgroundColor: Colors.grey[200]);
}
