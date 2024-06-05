import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Color.fromRGBO(241, 244, 249, 1),
    primary: Color.fromRGBO(29, 174, 255, 1),
    secondary: Color.fromRGBO(29, 174, 255, 1),
  ),
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Color.fromRGBO(2, 6, 23, 1),
    primary: Color.fromRGBO(29, 174, 255, 1),
    secondary: Color.fromRGBO(29, 174, 255, 1),
  ),
);

/* 
ThemeData(
        primaryColor: Colors.blue.shade800,
        hintColor: Colors.amber,
        appBarTheme: AppBarTheme(
          color: Colors.blue.shade800,
          titleTextStyle: TextStyle(
            color: Colors.amber.shade600,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          actionsIconTheme: IconThemeData(color: Colors.amber.shade600),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.amber),
            foregroundColor: MaterialStateProperty.all(Colors.blue.shade800),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade800),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade800),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber.shade600),
          ),
          labelStyle: TextStyle(color: Colors.blue.shade800),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
*/