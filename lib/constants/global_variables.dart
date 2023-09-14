import 'package:flutter/material.dart';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 118, 228, 156),
      Color.fromARGB(255, 149, 216, 172),
    ],
    stops: [0.5, 1.0],
  );

  static const primaryColor = Color(0xff76e49c);
  static const secondaryColor = Color.fromARGB(255, 149, 216, 172);
  static const backgroundColor = Color.fromRGBO(248, 249, 250, 1);
  static const Color greyBackgroundCOlor = Color.fromARGB(255, 123, 123, 124);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
}
