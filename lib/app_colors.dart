import 'package:flutter/material.dart';

abstract class AppColors {
  static const background = Color(0xFFF6F6F6);
  static const secondBackground = Colors.white;
  static const foreground = Color(0xFF181818);
  static const primary = Color(0xFF1268b0);
  static const error = Colors.redAccent;
  static const warning = Colors.amberAccent;
  static const success = Colors.greenAccent;
  static const info = Colors.purpleAccent;

  static MaterialColor colorToMatColor(Color c) {
    Map<int, Color> color = {
      50: Color.fromRGBO(c.red, c.green, c.blue, .1),
      100: Color.fromRGBO(c.red, c.green, c.blue, .2),
      200: Color.fromRGBO(c.red, c.green, c.blue, .3),
      300: Color.fromRGBO(c.red, c.green, c.blue, .4),
      400: Color.fromRGBO(c.red, c.green, c.blue, .5),
      500: Color.fromRGBO(c.red, c.green, c.blue, .6),
      600: Color.fromRGBO(c.red, c.green, c.blue, .7),
      700: Color.fromRGBO(c.red, c.green, c.blue, .8),
      800: Color.fromRGBO(c.red, c.green, c.blue, .9),
      900: Color.fromRGBO(c.red, c.green, c.blue, 1),
    };
    return MaterialColor(c.value, color);
  }
}
