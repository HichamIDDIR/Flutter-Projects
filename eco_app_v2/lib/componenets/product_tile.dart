import 'package:eco_app_v2/models/product.dart';
import 'package:eco_app_v2/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProdutTile extends StatelessWidget {
  final Product product;
  const MyProdutTile({super.key, required this.product});

  // add to cart button
  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: Text("       Add this item to your cart ???"),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // cancel button
                  MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel"),
                  ),
                  // yes button
                  MaterialButton(
                    onPressed: () {
                      //pop the dialog box
                      Navigator.pop(context);
                      // add to cart
                      context.read<Shop>().addProductToCart(product);
                    },
                    child: Text("Yes"),
                  ),
                ],
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // product image
          AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              width: double.infinity,
              padding: EdgeInsets.all(25),
              child: Image.asset(product.imagePath),
            ),
          ),
          SizedBox(height: 25),

          // product name
          Text(
            product.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 10),

          // product description
          Text(
            product.decription,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Spacer(),

          // product price + add to the cart
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${product.price.toStringAsFixed(2)}"),
              // add to cart button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: Icon(Icons.add),
                ),
              ),
            ],
          ), // add to cart button
        ],
      ),
    );
  }
}
