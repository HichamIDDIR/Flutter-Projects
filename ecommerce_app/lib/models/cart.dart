import 'package:ecommerce_app/models/sale.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // list of sales for sale
  List<Sale> salesShop = [
    Sale(
      name: "Stealth Duck",
      price: "200 Dark Quacks",
      imagePath: "lib/images/duck.png",
      description: 'The hero Gotham’s pond deserves.',
    ),
    Sale(
      name: "The Silent Pop",
      price: '99 Creeps',
      imagePath: "lib/images/baloon.png",
      description: 'Seen once. Never again.',
    ),
    Sale(
      name: "The Moon",
      price: '600 Creepy Credits',
      imagePath: "lib/images/Moon.png",
      description: "Pre-owned. Wolf-tested.",
    ),
    Sale(
      name: 'Ring of Light',
      price: '300 Blinds',
      imagePath: "lib/images/ring.png",
      description: 'Blinds villains and friends.',
    ),
    Sale(
      name: "Bat Cake",
      price: "\$0, Just for you :D",
      imagePath: "lib/images/Cake.png",
      description: "The dark knight of desserts.",
    ),
  ];

  //list of items in use carr
  List<Sale> userCart = [];
  // get list of sales for sale
  List<Sale> getSaleList() {
    return salesShop;
  }

  // get cart
  List<Sale> getSalesCart() {
    return userCart;
  }

  // add item to cart
  void addItemtoCart(Sale sale) {
    userCart.add(sale);
    notifyListeners();
  }

  // remove item from cart
  void removeItemfromCart(Sale sale) {
    userCart.remove(sale);
    notifyListeners();
  }
}
