import 'package:flutter/material.dart';

enum MyThemeKeys { LIGHT, DARK }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xff232c13), // so when the rebuilds the color changes take effect
    primaryColorLight: Color(0xff39412a),
    primaryColorDark: Color(0xff161f07),
    bottomAppBarColor: Color(0xff91a57d),
    brightness: Brightness.light,
    backgroundColor: Color(0xfff3efdf),
    dialogBackgroundColor: Color(0xfff2f1da),
    accentColor: Color(0xffcdba72),
    dividerColor: Color(0xffcdba72),
    highlightColor: Color(0xff91a57d).withOpacity(0.3),
    textSelectionColor: Color(0xff91a57d).withOpacity(0.3),
    textSelectionHandleColor: Color(0xfff3efdf),
    indicatorColor: Color(0xffcdba72),
    buttonColor: Color(0xffcdba72),
    toggleableActiveColor: Color(0xffcdba72),
    scaffoldBackgroundColor: Color(0xff232c13),
    canvasColor: Color(0xfff3efdf),
    hoverColor: Color(0xfff2f1da),
    disabledColor: Color(0Xffffffff),
    hintColor: Color(0xff232c13),

  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Color(0xff303030), // so when the rebuilds the color changes take effect
    primaryColorLight: Color(0xff424242),
    primaryColorDark: Color(0xff212121),
    bottomAppBarColor: Color(0xff424242),
    backgroundColor: Color(0xff303030),
    dialogBackgroundColor: Color(0xff303030),
    accentColor: Color(0xffffffff),
    dividerColor: Color(0xffffffff),
    highlightColor: Color(0xff424242).withOpacity(0.3),
    textSelectionColor: Color(0xffffffff).withOpacity(0.7),
    textSelectionHandleColor: Color(0xffffffff),
    indicatorColor: Color(0xffffffff),
    buttonColor: Color(0xff303030),
    toggleableActiveColor: Color(0xff424242),
    scaffoldBackgroundColor: Color(0xff212121),
    canvasColor: Color(0xff424242),
    cardColor: Color(0xff303030),
    hoverColor: Color(0xffffffff),
    hintColor: Color(0xffffffff),

    brightness: Brightness.dark,
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHT:
        return lightTheme;
      case MyThemeKeys.DARK:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}