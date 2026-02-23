import 'package:flutter/material.dart';

class OrderSummaryPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const OrderSummaryPage({super.key, required this.cartItems});

  double getTotal() {
    double total = 0;

    for (var item in cartItems) {
      if (item["price"] != null) {
        total += (item["price"] as num).toDouble();
      }
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Summary")),
      body: cartItems.isEmpty
          ? const Center(child: Text("No items in cart"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (_, i) {
                      return ListTile(
                        title: Text(cartItems[i]["name"]),
                        trailing: Text(
                          "₹${(cartItems[i]["price"] as num).toDouble().toStringAsFixed(2)}",
                        ),
                      );
                    },
                  ),
                ),

                const Divider(),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Grand Total: ₹${getTotal().toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
