import 'package:eco_app_v2/models/shop.dart';
import 'package:eco_app_v2/pages/cart_page.dart';
import 'package:eco_app_v2/pages/into_page.dart';
import 'package:eco_app_v2/pages/shop_page.dart';
import 'package:eco_app_v2/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Shop(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightMode,
      routes: {
        '/shop': (context) => ShopPage(),
        '/intro': (context) => IntroPage(),
        '/cart': (context) => MyCart(),
      },
    );
  }
}
