import 'package:eco_app_v2/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  // product for sale,
  final List<Product> _shop = [
    // product 1
    Product(
      name: "EchoWave X1",
      price: 129.99,
      decription:
          "Ultra-light wireless headphones with immersive 3D sound and adaptive noise cancellation. Enjoy up to 30 hours of pure, high-quality audio.",
      imagePath: "images/product1.png",
    ),
    // product 2
    Product(
      name: "Silentium Pro",
      price: 179.99,
      decription:
          "High-fidelity headphones with deep bass and crisp highs. Foldable, stylish, and designed for audiophiles who love powerful sound.",
      imagePath: "images/product2.png",
    ),
    // product 3
    Product(
      name: "NeonPulse Vibe",
      price: 149.99,
      decription:
          "Advanced noise cancellation with ambient mode for focus or awareness. Plush memory foam ear cups ensure all-day comfort.",
      imagePath: "images/product3.png",
    ),
    // product 4
    Product(
      name: "AetherTune Air",
      price: 99.99,
      decription:
          "Minimalist, ultra-portable headphones with touch controls, a sleek matte finish, and 20-hour battery life. Simple yet powerful.",
      imagePath: "images/product4.png",
    ),
  ];

  //user cart
  final List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;
  // get user cart
  List<Product> get cart => _cart;

  // add item to cart

  void addProductToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeProductFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
