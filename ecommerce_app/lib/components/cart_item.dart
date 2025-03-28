import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/sale.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  Sale sale;

  CartItem({super.key, required this.sale});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  //remove item from cart
  void removeitemfromcart() {
    Provider.of<Cart>(context, listen: false).removeItemfromCart(widget.sale);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.sale.imagePath),
        title: Text(widget.sale.name),
        subtitle: Text(widget.sale.price),
        trailing: IconButton(
          onPressed: () => removeitemfromcart(),
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
