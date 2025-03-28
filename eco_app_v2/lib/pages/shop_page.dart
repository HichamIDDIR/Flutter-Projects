import 'package:eco_app_v2/componenets/drawer.dart';
import 'package:eco_app_v2/componenets/product_tile.dart';
import 'package:eco_app_v2/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Shop Page'),
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // go to cart button
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart'),
            icon: Icon(Icons.shopping_cart_checkout_outlined),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          SizedBox(height: 25),
          // shop subtitle
          Center(
            child: Text(
              "Don't stay there looking, CHOOSE SOMEHTING!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          //product list
          SizedBox(
            height: 550,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,

              itemCount: products.length,
              padding: EdgeInsets.all(15),

              itemBuilder: (context, index) {
                // get each indivdual product from the shop
                final product = products[index];

                // return as a product tile UI
                return MyProdutTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
