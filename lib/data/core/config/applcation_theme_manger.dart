import 'package:flutter/material.dart';

import 'colors_palette.dart';

class ApplactionThemeManger {
  static ThemeData themeData = ThemeData(
    primaryColor: ColorPalette.primaryColor,
    appBarTheme: const AppBarTheme(
      titleTextStyle:
          TextStyle(color: Colors.white, fontFamily: "Exo", fontSize: 22),
      backgroundColor: ColorPalette.primaryColor,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 20,
      ),
    ),
  );
}
