import 'package:flutter/material.dart';
import 'colors/light_palette.dart';

final ColorScheme kLightColorScheme = ColorScheme.light(
  primary: LightPalette.orange, //FF8E42
  onPrimary: LightPalette.textGray, //032326
  secondary: LightPalette.blue, //0000CE
  tertiary: const Color(0xFFFFFFFF),
  surface: LightPalette.grayGainsBoro, //F5F5F9
  onTertiary: LightPalette.black, //000000
  error: LightPalette.redElectric, //E50000
  shadow: LightPalette.blackSilver, //707070
  primaryContainer: LightPalette.offWhite, // FFFFFF
  scrim: LightPalette.gray, //#D4D4D4,
  tertiaryContainer: LightPalette.yellowGold, //FFE621
);
