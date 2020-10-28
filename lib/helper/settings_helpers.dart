import 'dart:convert';
import 'dart:ui';
import 'package:quiver/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsHelpers {

  SharedPreferences prefs;

  static final SettingsHelpers instance = SettingsHelpers._internal();
  SettingsHelpers._internal(){
    _init();
  }

  factory SettingsHelpers() => instance;

  void _init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void fontSizeArabic(double fontSize) async {
    await prefs.setString('fontSizeArabic', fontSize.toString());
  }

  static const double minFontSizeArabic = 12;

  double get getFontSizeArabic {
    String fontSizeString = prefs.getString('fontSizeArabic');
    return double.tryParse(fontSizeString ?? minFontSizeArabic.toString());
  }

  Future setLocale(Locale locale) async {
    var map = {
      'languageCode': locale.languageCode,
    };
    var json = jsonEncode(map);
    await prefs.setString('locale', json);
  }

  Locale getLocale() {
    var json = prefs.getString('locale');
    if (isBlank(json)) {
      return Locale('ar');
    }
    var mapJson = jsonDecode(json);
    var locale = Locale(mapJson["languageCode"]);
    return locale;
  }

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }
}

