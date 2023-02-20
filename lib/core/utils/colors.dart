import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Colors
const Color kprimaryBlack = Color(0xff202c3b);

class AppThemes {
  static const int light = 0;
  static const int dark = 1;
}

final themeCollection = ThemeCollection(
  themes: {
    AppThemes.light: ThemeData(
      primaryColor: kprimaryBlack,
      fontFamily: 'CircularAir',
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.grey[100],
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    ),
    AppThemes.dark: ThemeData(
      primaryColor: kprimaryBlack,
      fontFamily: 'CircularAir',
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.grey[900],
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    ),
  },
);
