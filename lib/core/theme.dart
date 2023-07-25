import 'package:flutter/material.dart';

// Themes
enum ThemeType {
  lightGreen,
  darkGreen;

  bool get isLightGreen => this == lightGreen;
  bool get isDarkGreen => this == darkGreen;
}

class AppTheme {
  static const defaultType = ThemeType.lightGreen;
  static final defaultTheme = AppTheme.fromType(defaultType);

  late ThemeType type;
  bool isDark;

  late Color primaryColor;
  late Color onPrimaryColor;
  late Color primaryTintColor;

  late Color secondaryColor;
  late Color accentColor;
  late Color onAccentColor;
  late Color bgColor;
  late Color focusColor;
  late Color onFocusColor;
  late Color greyWeakColor;
  late Color greyColor;
  late Color greyMediumColor;
  late Color greyStrongColor;
  late Color surface;
  late Color greySoftColor;
  late Color softBlackColor;
  late Color greyLightColor;

  late Color iconColor;
  late Color mainTextColor;
  late Color secondTextColor;
  late Color inverseTextColor;

  AppTheme({this.isDark = false}) {
    mainTextColor = isDark ? Colors.white : Colors.black;
    secondTextColor = const Color(0xFF8A8A8A);
    inverseTextColor = isDark ? Colors.black : Colors.white;
    iconColor = isDark ? Colors.white : const Color(0xFF242424);
  }

  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.lightGreen:
        return AppTheme(isDark: false)
          ..type = t
          ..greyStrongColor = const Color(0xff333333)
          ..greyLightColor = const Color.fromRGBO(248, 248, 248, 1)
          ..softBlackColor = const Color.fromRGBO(36, 36, 36, 0.64)
          ..greySoftColor = const Color.fromRGBO(245, 245, 245, 1)
          ..primaryColor = const Color.fromARGB(255, 58, 137, 68)
          ..onPrimaryColor = const Color(0xFFFFFFFF)
          ..primaryTintColor = const Color(0x3053B175)
          ..accentColor = const Color(0xFFD0103F)
          ..onAccentColor = const Color(0xFFFFFFFF)
          ..focusColor = const Color(0x3000BB29)
          ..onFocusColor = const Color(0xFFFFFFFF)
          ..secondaryColor = const Color(0xFF000000)
          ..bgColor = const Color(0xFFFFFFFF)
          ..surface = const Color(0xFFFFFFFF)
          ..greyWeakColor = const Color(0xffEFEFEF)
          ..greyColor = const Color(0xff8a8a8a)
          ..greyMediumColor = const Color(0xff747474)
          ..greyStrongColor = const Color(0xff333333);

      case ThemeType.darkGreen:
        return AppTheme(isDark: true)
          ..type = t
          ..softBlackColor = Colors.white
          ..greySoftColor = const Color.fromRGBO(245, 245, 245, 1)
          ..primaryColor = const Color(0xFF21A700)
          ..onPrimaryColor = const Color(0xFFFFFFFF)
          ..primaryTintColor = const Color(0x3053B175)
          ..accentColor = const Color.fromARGB(255, 208, 138, 16)
          ..onAccentColor = const Color(0xFFFFFFFF)
          ..focusColor = const Color(0x3053B175)
          ..onFocusColor = const Color(0xFFFFFFFF)
          ..secondaryColor = const Color(0xFFA3EBFB)
          ..bgColor = const Color(0xFF263236)
          ..surface = const Color.fromARGB(255, 26, 36, 38)
          ..greyWeakColor = const Color(0xffEFEFEF)
          ..greyColor = const Color(0xff8a8a8a)
          ..greyMediumColor = const Color(0xff747474)
          ..greyStrongColor = const Color(0xff333333)
          ..greyLightColor = const Color.fromRGBO(248, 248, 248, 1);
    }

    // return AppTheme.fromType(defaultTheme);
  }

  ThemeData get themeData {
    var t = ThemeData(
      // useMaterial3: true,
      scaffoldBackgroundColor: bgColor,
      snackBarTheme: SnackBarThemeData(
        actionTextColor: primaryColor,
      ),
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primaryColor,
        secondary: secondaryColor,
        background: bgColor,
        surface: surface,
        surfaceTint: bgColor,
        onBackground: mainTextColor,
        onSurface: mainTextColor,
        onError: mainTextColor,
        onPrimary: onPrimaryColor,
        onSecondary: inverseTextColor,
        error: focusColor,
      ),
    );

    return t.copyWith(
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: primaryColor,
        selectionHandleColor: Colors.transparent,
        selectionColor: primaryColor,
      ),

      buttonTheme: ButtonThemeData(
        height: 55,
        buttonColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        highlightColor: greyWeakColor,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: onPrimaryColor,
          minimumSize: const Size.fromHeight(55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 25),
          textStyle: TextStyle(color: onPrimaryColor),
        ),
      ),
      iconTheme: IconThemeData(color: iconColor),
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.only(left: 12, right: 25),
          hintStyle: const TextStyle(
            fontSize: 13,
            color: Color(0xFF797979),
            fontWeight: FontWeight.w400,
          ),
          fillColor: greyLightColor,
          filled: true,
          errorStyle: const TextStyle(fontSize: 12, color: Colors.redAccent),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: greyColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF5D5D5D)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF5D5D5D)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red),
          )),
      // buttonColor: primaryColor,
      primaryColor: primaryColor,
      // highlightColor: shift(Colors.grey.shade400, .1),
    );
  }
}
