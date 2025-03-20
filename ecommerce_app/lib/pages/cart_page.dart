import 'package:ecommerce_app/components/cart_item.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/sale.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder:
          (context, value, child) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "The Shadow Vault",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 25),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.getSalesCart().length,
                    itemBuilder: (context, index) {
                      // get every item
                      Sale individualsale = value.getSalesCart()[index];

                      // return the cart item
                      return CartItem(sale: individualsale);
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
