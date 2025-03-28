import 'package:eco_app_v2/componenets/button.dart';
import 'package:eco_app_v2/models/product.dart';
import 'package:eco_app_v2/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});
  //remove  item from cart
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: Text("remove this item to your cart ???"),
            actions: [
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
                  // remove to cart
                  context.read<Shop>().removeProductFromCart(product);
                },
                child: Text("Yes"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          // cart list
          Expanded(
            child:
                cart.isEmpty
                    ? Center(
                      child: Text("It's empty\nYou better buy something ;-;"),
                    )
                    : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        // get individual itemm from cart
                        final item = cart[index];

                        //return as a cart tile UIa4

                        return ListTile(
                          leading: Image.asset(item.imagePath, height: 45),
                          title: Text(item.name),
                          subtitle: Text("Price: ${item.price}"),
                          trailing: IconButton(
                            onPressed: () => removeItemFromCart(context, item),
                            icon: Icon(Icons.remove),
                          ),
                        );
                      },
                    ),
          ),

          // pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Mybutton(
              onTap: () => payButtonPressed(context),
              child: Text('PAY NOW'),
            ),
          ),
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: Text("User wants to pay! <3\nGood you are not a thief :3"),
          ),
    );
  }
}
