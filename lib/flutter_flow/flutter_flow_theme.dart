// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color blue;
  late Color turquoise;
  late Color cultured;
  late Color teal900;
  late Color teal500;
  late Color midnightBlue;
  late Color darkCornflowerBlue;
  late Color starCommandBlue;
  late Color blueGreen;
  late Color pacificBlue;
  late Color skyBlueCrayola;
  late Color middleBlue;
  late Color blizzardBlue;
  late Color gray600;
  late Color transparent;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFF928163);
  late Color secondaryColor = const Color(0xFF14181B);
  late Color tertiaryColor = const Color(0xFFDCC294);
  late Color alternate = const Color(0xFFEF6C00);
  late Color primaryBackground = const Color(0xFFF1F4F8);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF2D1E04);

  late Color blue = Color(0xFF3A28DE);
  late Color turquoise = Color(0xFF34D1BF);
  late Color cultured = Color(0xFFEFEFEF);
  late Color teal900 = Color(0xFF004D40);
  late Color teal500 = Color(0xFF009688);
  late Color midnightBlue = Color(0xFF03045E);
  late Color darkCornflowerBlue = Color(0xFF023E8A);
  late Color starCommandBlue = Color(0xFF0077B6);
  late Color blueGreen = Color(0xFF0096C7);
  late Color pacificBlue = Color(0xFF00B4D8);
  late Color skyBlueCrayola = Color(0xFF48CAE4);
  late Color middleBlue = Color(0xFF90E0EF);
  late Color blizzardBlue = Color(0xFFADE8F4);
  late Color gray600 = Color(0xFF757575);
  late Color transparent = Color(0x00000000);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Mogra';
  TextStyle get title1 => GoogleFonts.getFont(
        'Mogra',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 34,
      );
  String get title2Family => 'Mogra';
  TextStyle get title2 => GoogleFonts.getFont(
        'Mogra',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 28,
      );
  String get title3Family => 'Mogra';
  TextStyle get title3 => GoogleFonts.getFont(
        'Mogra',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 20,
      );
  String get subtitle1Family => 'Mogra';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Mogra',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      );
  String get subtitle2Family => 'Mogra';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Mogra',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  String get bodyText1Family => 'Mogra';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Mogra',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  String get bodyText2Family => 'Mogra';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Mogra',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFF36260A);
  late Color secondaryColor = const Color(0xFF14181B);
  late Color tertiaryColor = const Color(0xFF3C3220);
  late Color alternate = const Color(0xFF2D1E04);
  late Color primaryBackground = const Color(0xFF1A1F24);
  late Color secondaryBackground = const Color(0xFF0F1316);
  late Color primaryText = const Color(0xFFDDDDDD);
  late Color secondaryText = const Color(0xFFEEEEEE);

  late Color blue = Color(0xFF3A28DE);
  late Color turquoise = Color(0xFF34D1BF);
  late Color cultured = Color(0xFF949BA4);
  late Color teal900 = Color(0xFFFFFFFF);
  late Color teal500 = Color(0x00000000);
  late Color midnightBlue = Color(0xFF03045E);
  late Color darkCornflowerBlue = Color(0xFF023E8A);
  late Color starCommandBlue = Color(0xFF0077B6);
  late Color blueGreen = Color(0xFF0096C7);
  late Color pacificBlue = Color(0xFF00B4D8);
  late Color skyBlueCrayola = Color(0xFF48CAE4);
  late Color middleBlue = Color(0xFF90E0EF);
  late Color blizzardBlue = Color(0xFFADE8F4);
  late Color gray600 = Color(0xFF424242);
  late Color transparent = Color(0x00000000);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
