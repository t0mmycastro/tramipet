import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tramipet/app/domain/repositories/preferences_repository.dart';

const Map<int, Color> swatch = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

const colorPrimarioDark = Color(0xff00bcd4);
const colorPrimarioLight = Color(0xff2962ff);

class ThemeController extends SimpleNotifier {
  late ThemeMode _mode;

  ThemeController() {
    _mode = _preferences.isDarkModeAlias ? ThemeMode.dark : ThemeMode.light;
  }

  final PreferencesRepository _preferences = Get.i.find();

  ThemeMode get mode => _mode;
  bool get isDark => _mode == ThemeMode.dark;

  TextTheme get _textTheme {
    return GoogleFonts.nunitoSansTextTheme();
  }

  ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: colorPrimarioLight,
      ),
      textTheme: _textTheme,
      primaryColorLight: colorPrimarioLight,
      colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.light,
          primarySwatch: MaterialColor(colorPrimarioLight.value, swatch)),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorPrimarioLight.withOpacity(0.5),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: colorPrimarioDark,
      ),
      textTheme: _textTheme.merge(ThemeData.dark().textTheme).apply(
            fontFamily: _textTheme.bodyText1!.fontFamily,
          ),
      scaffoldBackgroundColor: const Color(0xff102027),
      primaryColorDark: colorPrimarioDark,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: colorPrimarioDark,
      ),
      colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
          primarySwatch: MaterialColor(colorPrimarioDark.value, swatch)),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorPrimarioDark,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white54,
          ),
        ),
      ),
    );
  }

  void toggle() {
    if (_mode == ThemeMode.light) {
      _mode = ThemeMode.dark;
      _preferences.darkMode(true);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      _mode = ThemeMode.light;
      _preferences.darkMode(false);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
    notify();
  }
}

final themeProvider =
    SimpleProvider((ref) => ThemeController(), autoDispose: false);
