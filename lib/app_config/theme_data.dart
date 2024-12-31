import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_take_home/app_config/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData() {
  return FlexThemeData.light(
    useMaterial3: true,
    colors: FlexSchemeColor.from(
      primary: appPrimaryColor,
      secondary: appSecondaryColor,
      brightness: appBrightnessLight,
    ),
    scaffoldBackground: appWhiteColor,
    swapColors: false,
    usedColors: 6,
    lightIsWhite: false,
    appBarStyle: FlexAppBarStyle.primary,
    appBarElevation: 0.5,
    appBarOpacity: 0.94,
    transparentStatusBar: true,
    tabBarStyle: FlexTabBarStyle.forAppBar,
    surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
    blendLevel: 20,
    tooltipsMatchBackground: true,
    fontFamily: GoogleFonts.notoSans().fontFamily,
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        fontSize: 41,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        letterSpacing: 0.5,
      ),
    ),
    tones: FlexTones.material(
      appBrightnessLight,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    platform: defaultTargetPlatform,
  );
}
