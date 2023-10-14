import 'package:flutter/material.dart';

class Styles {
  static ColorScheme myColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFFc1121f),
  );

  static ThemeData lightTheme = ThemeData().copyWith(
    useMaterial3: true,
    colorScheme: myColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      centerTitle: true,
      foregroundColor: myColorScheme.primary,
      backgroundColor: myColorScheme.onPrimary,
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    colorScheme: myColorScheme,
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme().copyWith(
      centerTitle: true,
      foregroundColor: Colors.white,
      backgroundColor: myColorScheme.onPrimaryContainer,
    ),
  );
}
