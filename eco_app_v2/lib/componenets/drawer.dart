import 'package:eco_app_v2/componenets/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //drawerheadder
          DrawerHeader(
            child: Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          SizedBox(height: 25),

          //Shop tile
          MyListTile(
            thetext: "Shop",
            theicon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          //cart tile
          MyListTile(
            thetext: "Cart",
            theicon: Icons.shopping_cart,

            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/cart');
            },
          ),
          Spacer(),

          //exit shop tile
          MyListTile(
            thetext: "Exit",
            theicon: Icons.logout,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/intro',
                (route) => false,
              );
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
