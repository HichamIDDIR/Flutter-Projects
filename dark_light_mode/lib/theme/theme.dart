import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: const Color.fromARGB(255, 214, 213, 213),
    primary: Colors.grey.shade300,
    secondary: const Color.fromARGB(255, 192, 192, 192),
  ),
);
ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 24, 24, 24),
    primary: const Color.fromARGB(255, 59, 59, 59),
    secondary: const Color.fromARGB(255, 124, 124, 124),
  ),
);
