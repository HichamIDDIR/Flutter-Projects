import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/counter_model.dart';
import 'package:provider_project/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => CounterModel(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: MyHomePage(title: "Flutter demo page"),
    );
  }
}
