import 'package:ecommerce_app/components/bottom_nav_bar.dart';
import 'package:ecommerce_app/pages/cart_page.dart';
import 'package:ecommerce_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this  int controls  where the bottom bar takes you
  int _selectindex = 0;
  // method to update

  void navigateBottomBar(int index) {
    setState(() {
      _selectindex = index;
    });
  }

  // pages to take you when you click on the bottom navigation bar
  final List<Widget> pages = [
    // a shop page
    const ShopPage(),

    // a cart page
    const CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder:
              (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Icon(Icons.menu, color: Colors.black),
                ),
              ),
        ),
      ),

      drawer: Drawer(
        backgroundColor: Colors.grey[900],

        child: Column(
          children: [
            //logo
            Column(
              children: [
                DrawerHeader(
                  padding: EdgeInsets.all(45),
                  decoration: BoxDecoration(color: Colors.grey[900]),
                  child: Image.asset(
                    'lib/images/Batman_Logo_2.png',
                    color: Colors.white,
                    fit: BoxFit.contain,
                  ),
                ),
                //other pages
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(Icons.home),
                    iconColor: Colors.white,

                    title: Text("Home"),
                    textColor: Colors.white,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(Icons.info),
                    iconColor: Colors.white,

                    title: Text("About"),
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
            Spacer(),

            Padding(
              padding: EdgeInsets.only(left: 25, bottom: 25),
              child: ListTile(
                leading: Icon(Icons.logout),
                iconColor: Colors.white,

                title: Text("Logout"),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: pages[_selectindex],
    );
  }
}
