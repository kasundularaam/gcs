import 'package:flutter/material.dart';

class AppTheme {
  static const int _bluePrimaryValue = 0xFF12235D;
  static const MaterialColor _blue = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      50: Color(0xFF12235D),
      100: Color(0xFF12235D),
      200: Color(0xFF12235D),
      300: Color(0xFF12235D),
      400: Color(0xFF12235D),
      500: Color(_bluePrimaryValue),
      600: Color(0xFF12235D),
      700: Color(0xFF12235D),
      800: Color(0xFF12235D),
      900: Color(0xFF12235D),
    },
  );
  const AppTheme._();
  static final lightTheme = ThemeData(
    primarySwatch: _blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData(
    primarySwatch: _blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
