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

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color onInfo;
  late Color onError;
  late Color onPrimaryContainer;
  late Color secondaryContainer;
  late Color onBackground;
  late Color onPrimary;
  late Color onAccent;
  late Color onSecondary;
  late Color fullContrast;
  late Color surfaceVariant;
  late Color onSurface;
  late Color onAccentContainer;
  late Color secondarybackground00;
  late Color primaryContainer;
  late Color transparent;
  late Color onSurfaceVariant;
  late Color onSuccess;
  late Color accentContainer;
  late Color onSecondaryContainer;
  late Color onWarning;
  late Color primary30;
  late Color secondarybackground000;
  late Color surface80;
  late Color surface30;
  late Color secondarybackground111;
  late Color surface90;
  late Color surface50;
  late Color accent10;
  late Color success10;
  late Color info10;
  late Color secondarybackground00000;
  late Color primary10;
  late Color fullContrast40;
  late Color success15;
  late Color success30;
  late Color error15;
  late Color error30;
  late Color secondarybackground999;
  late Color secondarybackgroundf;

  FFDesignTokens get designToken => FFDesignTokens(this);

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  bool get displayLargeIsCustom => typography.displayLargeIsCustom;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  bool get displayMediumIsCustom => typography.displayMediumIsCustom;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  bool get displaySmallIsCustom => typography.displaySmallIsCustom;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  bool get headlineLargeIsCustom => typography.headlineLargeIsCustom;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  bool get headlineMediumIsCustom => typography.headlineMediumIsCustom;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  bool get headlineSmallIsCustom => typography.headlineSmallIsCustom;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  bool get titleLargeIsCustom => typography.titleLargeIsCustom;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  bool get titleMediumIsCustom => typography.titleMediumIsCustom;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  bool get titleSmallIsCustom => typography.titleSmallIsCustom;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  bool get labelLargeIsCustom => typography.labelLargeIsCustom;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  bool get labelMediumIsCustom => typography.labelMediumIsCustom;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  bool get labelSmallIsCustom => typography.labelSmallIsCustom;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  bool get bodyLargeIsCustom => typography.bodyLargeIsCustom;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  bool get bodyMediumIsCustom => typography.bodyMediumIsCustom;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  bool get bodySmallIsCustom => typography.bodySmallIsCustom;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF22C55E);
  late Color secondary = const Color(0xFF64748B);
  late Color tertiary = const Color(0xFF10B981);
  late Color alternate = const Color(0xFFF1F5F9);
  late Color primaryText = const Color(0xFF0F172A);
  late Color secondaryText = const Color(0xFF64748B);
  late Color primaryBackground = const Color(0xFFF8FAFC);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0x00000000);
  late Color accent2 = const Color(0x00000000);
  late Color accent3 = const Color(0xFF94A3B8);
  late Color accent4 = const Color(0x00000000);
  late Color success = const Color(0xFF22C55E);
  late Color warning = const Color(0xFFF59E0B);
  late Color error = const Color(0xFFEF4444);
  late Color info = const Color(0xFF3B82F6);

  late Color onInfo = const Color(0xFFFFFFFF);
  late Color onError = const Color(0xFFFFFFFF);
  late Color onPrimaryContainer = const Color(0xFF0F172A);
  late Color secondaryContainer = const Color(0x1A64748B);
  late Color onBackground = const Color(0xFF0F172A);
  late Color onPrimary = const Color(0xFFFFFFFF);
  late Color onAccent = const Color(0xFFFFFFFF);
  late Color onSecondary = const Color(0xFFFFFFFF);
  late Color fullContrast = const Color(0xFF000000);
  late Color surfaceVariant = const Color(0xFFF1F5F9);
  late Color onSurface = const Color(0xFF0F172A);
  late Color onAccentContainer = const Color(0xFF0F172A);
  late Color secondarybackground00 = const Color(0xFFE9ECEF);
  late Color primaryContainer = const Color(0x1A22C55E);
  late Color transparent = const Color(0x00000000);
  late Color onSurfaceVariant = const Color(0xFF64748B);
  late Color onSuccess = const Color(0xFFFFFFFF);
  late Color accentContainer = const Color(0x1A10B981);
  late Color onSecondaryContainer = const Color(0xFF0F172A);
  late Color onWarning = const Color(0xFFFFFFFF);
  late Color primary30 = const Color(0x4D2ECC71);
  late Color secondarybackground000 = const Color(0xFFF1F5F9);
  late Color surface80 = const Color(0xCCFFFFFF);
  late Color surface30 = const Color(0x4DFFFFFF);
  late Color secondarybackground111 = const Color(0xFFF1F5F9);
  late Color surface90 = const Color(0xE6FFFFFF);
  late Color surface50 = const Color(0x80FFFFFF);
  late Color accent10 = const Color(0x1A10B981);
  late Color success10 = const Color(0x1A22C55E);
  late Color info10 = const Color(0x1A3B82F6);
  late Color secondarybackground00000 = const Color(0xFFF1F5F9);
  late Color primary10 = const Color(0x1A22C55E);
  late Color fullContrast40 = const Color(0x66000000);
  late Color success15 = const Color(0x2622C55E);
  late Color success30 = const Color(0x4D22C55E);
  late Color error15 = const Color(0x26EF4444);
  late Color error30 = const Color(0x4DEF4444);
  late Color secondarybackground999 = const Color(0xFFF1F5F9);
  late Color secondarybackgroundf = const Color(0xFFF1F5F9);
}

abstract class Typography {
  String get displayLargeFamily;
  bool get displayLargeIsCustom;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  bool get displayMediumIsCustom;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  bool get displaySmallIsCustom;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  bool get headlineLargeIsCustom;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  bool get headlineMediumIsCustom;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  bool get headlineSmallIsCustom;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  bool get titleLargeIsCustom;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  bool get titleMediumIsCustom;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  bool get titleSmallIsCustom;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  bool get labelLargeIsCustom;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  bool get labelMediumIsCustom;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  bool get labelSmallIsCustom;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  bool get bodyLargeIsCustom;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  bool get bodyMediumIsCustom;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  bool get bodySmallIsCustom;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Plus Jakarta Sans';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w800,
        fontSize: 58.0,
        height: 1.1,
      );
  String get displayMediumFamily => 'Plus Jakarta Sans';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w800,
        fontSize: 46.0,
        height: 1.15,
      );
  String get displaySmallFamily => 'Plus Jakarta Sans';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.bold,
        fontSize: 38.0,
        height: 1.2,
      );
  String get headlineLargeFamily => 'Plus Jakarta Sans';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.bold,
        fontSize: 32.0,
        height: 1.2,
      );
  String get headlineMediumFamily => 'Plus Jakarta Sans';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.bold,
        fontSize: 26.0,
        height: 1.2,
      );
  String get headlineSmallFamily => 'Plus Jakarta Sans';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
        height: 1.2,
      );
  String get titleLargeFamily => 'Plus Jakarta Sans';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
        height: 1.3,
      );
  String get titleMediumFamily => 'Plus Jakarta Sans';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w600,
        fontSize: 17.0,
        height: 1.3,
      );
  String get titleSmallFamily => 'Plus Jakarta Sans';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
        height: 1.3,
      );
  String get labelLargeFamily => 'Inter';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
        height: 1.3,
      );
  String get labelMediumFamily => 'Inter';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 12.0,
        height: 1.3,
      );
  String get labelSmallFamily => 'Inter';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 10.0,
        height: 1.2,
      );
  String get bodyLargeFamily => 'Inter';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.inter(
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        height: 1.5,
      );
  String get bodyMediumFamily => 'Inter';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.inter(
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        height: 1.5,
      );
  String get bodySmallFamily => 'Inter';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.inter(
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
        height: 1.4,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF4ADE80);
  late Color secondary = const Color(0xFF94A3B8);
  late Color tertiary = const Color(0xFF34D399);
  late Color alternate = const Color(0xFF1E293B);
  late Color primaryText = const Color(0xFFF8FAFC);
  late Color secondaryText = const Color(0xFF94A3B8);
  late Color primaryBackground = const Color(0xFF020617);
  late Color secondaryBackground = const Color(0xFF1E293B);
  late Color accent1 = const Color(0x00000000);
  late Color accent2 = const Color(0x00000000);
  late Color accent3 = const Color(0xFF475569);
  late Color accent4 = const Color(0x00000000);
  late Color success = const Color(0xFF4ADE80);
  late Color warning = const Color(0xFFFBBF24);
  late Color error = const Color(0xFFF87171);
  late Color info = const Color(0xFF60A5FA);

  late Color onInfo = const Color(0xFFFFFFFF);
  late Color onError = const Color(0xFFFFFFFF);
  late Color onPrimaryContainer = const Color(0xFFF8FAFC);
  late Color secondaryContainer = const Color(0x2494A3B8);
  late Color onBackground = const Color(0xFFF8FAFC);
  late Color onPrimary = const Color(0xFF000000);
  late Color onAccent = const Color(0xFFFFFFFF);
  late Color onSecondary = const Color(0xFFFFFFFF);
  late Color fullContrast = const Color(0xFFFFFFFF);
  late Color surfaceVariant = const Color(0xFF334155);
  late Color onSurface = const Color(0xFFF8FAFC);
  late Color onAccentContainer = const Color(0xFFF8FAFC);
  late Color secondarybackground00 = const Color(0xFF1E1E1E);
  late Color primaryContainer = const Color(0x244ADE80);
  late Color transparent = const Color(0x00000000);
  late Color onSurfaceVariant = const Color(0xFF94A3B8);
  late Color onSuccess = const Color(0xFF000000);
  late Color accentContainer = const Color(0x2434D399);
  late Color onSecondaryContainer = const Color(0xFFF8FAFC);
  late Color onWarning = const Color(0xFF000000);
  late Color primary30 = const Color(0x4D2ECC71);
  late Color secondarybackground000 = const Color(0xFF0F172A);
  late Color surface80 = const Color(0xCC1E293B);
  late Color surface30 = const Color(0x4D1E293B);
  late Color secondarybackground111 = const Color(0xFF0F172A);
  late Color surface90 = const Color(0xE61E293B);
  late Color surface50 = const Color(0x801E293B);
  late Color accent10 = const Color(0x1A34D399);
  late Color success10 = const Color(0x1A4ADE80);
  late Color info10 = const Color(0x1A60A5FA);
  late Color secondarybackground00000 = const Color(0xFF0F172A);
  late Color primary10 = const Color(0x1A4ADE80);
  late Color fullContrast40 = const Color(0x66FFFFFF);
  late Color success15 = const Color(0x264ADE80);
  late Color success30 = const Color(0x4D4ADE80);
  late Color error15 = const Color(0x26F87171);
  late Color error30 = const Color(0x4DF87171);
  late Color secondarybackground999 = const Color(0xFF0F172A);
  late Color secondarybackgroundf = const Color(0xFF0F172A);
}

class FFDesignTokens {
  const FFDesignTokens(this.theme);
  final FlutterFlowTheme theme;
  FFSpacing get spacing => const FFSpacing();
  FFRadius get radius => const FFRadius();
  FFShadows get shadow => FFShadows(theme);
}

class FFSpacing {
  const FFSpacing();
  double get none => 0.0;
  double get xs => 4.0;
  double get sm => 8.0;
  double get md => 16.0;
  double get lg => 24.0;
  double get xl => 32.0;
  double get xxl => 48.0;
  double get xxxl => 64.0;
}

class FFRadius {
  const FFRadius();
  double get none => 0.0;
  double get xs => 4.0;
  double get sm => 8.0;
  double get md => 12.0;
  double get lg => 20.0;
  double get xl => 28.0;
  double get xxl => 36.0;
  double get full => 9999.0;
}

class FFShadows {
  const FFShadows(this.theme);
  final FlutterFlowTheme theme;
  BoxShadow get xxl => const BoxShadow(
      blurRadius: 40.0,
      color: const Color(0x33000000),
      offset: const Offset(0.0, 20.0),
      spreadRadius: 0.0);
  BoxShadow get lg => const BoxShadow(
      blurRadius: 16.0,
      color: const Color(0x1A000000),
      offset: const Offset(0.0, 8.0),
      spreadRadius: 0.0);
  BoxShadow get sm => const BoxShadow(
      blurRadius: 4.0,
      color: const Color(0x0D000000),
      offset: const Offset(0.0, 2.0),
      spreadRadius: 0.0);
  BoxShadow get none => const BoxShadow(
      blurRadius: 0.0,
      color: const Color(0x00000000),
      offset: const Offset(0.0, 0.0),
      spreadRadius: 0.0);
  BoxShadow get xs => const BoxShadow(
      blurRadius: 2.0,
      color: const Color(0x0A000000),
      offset: const Offset(0.0, 1.0),
      spreadRadius: 0.0);
  BoxShadow get xl => const BoxShadow(
      blurRadius: 24.0,
      color: const Color(0x26000000),
      offset: const Offset(0.0, 12.0),
      spreadRadius: 0.0);
  BoxShadow get md => const BoxShadow(
      blurRadius: 8.0,
      color: const Color(0x14000000),
      offset: const Offset(0.0, 4.0),
      spreadRadius: 0.0);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    TextStyle? font,
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = false,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
    String? package,
  }) {
    if (useGoogleFonts && fontFamily != null) {
      font = GoogleFonts.getFont(fontFamily,
          fontWeight: fontWeight ?? this.fontWeight,
          fontStyle: fontStyle ?? this.fontStyle);
    }

    return font != null
        ? font.copyWith(
            color: color ?? this.color,
            fontSize: fontSize ?? this.fontSize,
            letterSpacing: letterSpacing ?? this.letterSpacing,
            fontWeight: fontWeight ?? this.fontWeight,
            fontStyle: fontStyle ?? this.fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          )
        : copyWith(
            fontFamily: fontFamily,
            package: package,
            color: color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          );
  }
}
