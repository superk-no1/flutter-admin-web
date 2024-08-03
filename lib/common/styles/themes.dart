import 'package:flutter/material.dart';

import 'color_schemes.g.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    colorScheme: lightColorScheme,
    fontFamily: 'Montserrat',
    useMaterial3: false,
  );

  static ThemeData dark = ThemeData(
    colorScheme: darkColorScheme,
    fontFamily: 'Montserrat',
    useMaterial3: false,
  );
}
