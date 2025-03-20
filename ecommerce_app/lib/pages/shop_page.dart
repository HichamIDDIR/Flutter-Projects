import 'package:ecommerce_app/components/sale_tile.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/sale.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // adding the item to the cart method
  void addItemToCart(Sale sale) {
    Provider.of<Cart>(context, listen: false).addItemtoCart(sale);

    // alert the use, item successfully added
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: const Color.fromARGB(207, 119, 119, 119),
            title: Text('Gotham approved. In your cart!'),
            content: Text('Your loot awaits in the shadows.'),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder:
          (context, value, child) => Column(
            children: [
              // search bar
              Container(
                padding: const EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Search", style: TextStyle(color: Colors.grey)),
                    Icon(Icons.search, color: Colors.grey),
                  ],
                ),
              ),

              //message
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Be the hero your shopping cart deserves.',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // hot picks
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Gotham’s Finest Finds ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),

              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    //a list of sale tiles
                    Sale sale = value.getSaleList()[index];
                    return SaleTile(
                      sale: sale,
                      onTap: () => addItemToCart(sale),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
                child: Divider(color: Colors.grey[100]),
              ),
            ],
          ),
    );
  }
}
