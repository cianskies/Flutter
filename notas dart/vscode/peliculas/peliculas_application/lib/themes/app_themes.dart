import 'package:flutter/material.dart';

class AppThemes{
    static const Color primary= Colors.red;
    static final ThemeData lightTheme = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
        color: Colors.amber,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white
        ),
        elevation: 1000,
      )

    );
}