import 'package:flutter/material.dart';
import 'data.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  String selectedMethod = "Card";
  double deliveryCharge = 50;

  double getSubtotal() {
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

    double subtotal = getSubtotal();
    double total = subtotal + deliveryCharge;

    return Scaffold(
      backgroundColor: const Color(0xffE8F5E9),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Payment"),
        centerTitle: true,
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                "Your Cart is Empty 🌿",
                style: TextStyle(fontSize: 18),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [

                  /// PAYMENT OPTIONS
                  buildOption("Debit/Credit Card", "Card"),
                  buildOption("Net Banking", "NetBanking"),
                  buildOption("Paypal", "Paypal"),
                  buildOption("Google Pay", "Gpay"),

                  const Spacer(),

                  /// BILL DETAILS
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        buildRow("Subtotal", subtotal),
                        buildRow("Delivery", deliveryCharge),
                        const Divider(),
                        buildRow("Total", total, isTotal: true),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// PAY BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {

                        if (cartItems.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Cart is empty"),
                            ),
                          );
                          return;
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Payment Successful 🎉"),
                          ),
                        );

                        setState(() {
                          cartItems.clear();
                        });

                        Navigator.popUntil(
                            context, (route) => route.isFirst);
                      },
                      child: const Text(
                        "Pay Now",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Widget buildOption(String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: RadioListTile(
        activeColor: Colors.green,
        value: value,
        groupValue: selectedMethod,
        onChanged: (val) {
          setState(() {
            selectedMethod = val.toString();
          });
        },
        title: Text(title),
      ),
    );
  }

  Widget buildRow(String title, double amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight:
                  isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            "₹${amount.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight:
                  isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
