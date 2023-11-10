import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'colors/light_palette.dart';
import 'light_color_scheme.dart';

final kLightThemeData = ThemeData(
  fontFamily: kFontFamily,
  brightness: Brightness.light,
  colorScheme: kLightColorScheme,
  scaffoldBackgroundColor: LightPalette.grayGainsBoro,
);
