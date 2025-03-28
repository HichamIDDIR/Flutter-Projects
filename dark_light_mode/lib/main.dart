import 'package:dark_light_mode/pages/home.dart';
import 'package:dark_light_mode/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import the provider package
// ignore: depend_on_referenced_packages

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(), // Provide the ThemeProvider
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
