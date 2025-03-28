import 'package:ecommerce_app/models/sale.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SaleTile extends StatelessWidget {
  Sale sale;
  void Function()? onTap;
  SaleTile({super.key, required this.sale, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // pic
          SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(sale.imagePath, width: 235, height: 200),
          ),

          //descroption
          Center(
            child: Text(
              sale.description,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),

          // price + details
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // sale name
                    Text(
                      sale.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 5),
                    //price
                    Text(sale.price, style: TextStyle(color: Colors.grey)),
                  ],
                ),
                // a pluss button
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
