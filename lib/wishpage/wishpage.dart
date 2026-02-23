import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<String> wishlistStrings = [];

  @override
  void initState() {
    super.initState();
    loadWishlist(); // പേജ് തുറക്കുമ്പോൾ ഡാറ്റ ലോഡ് ചെയ്യുക
  }

  // SharedPreferences-ൽ നിന്ന് ഡാറ്റ എടുക്കുന്നു
  Future<void> loadWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      wishlistStrings = prefs.getStringList('wishlist_data') ?? [];
    });
  }

  // ഐറ്റം ഡിലീറ്റ് ചെയ്യാനും സ്റ്റോറേജ് അപ്ഡേറ്റ് ചെയ്യാനും
  Future<void> removeItem(int index) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      wishlistStrings.removeAt(index);
    });
    await prefs.setStringList('wishlist_data', wishlistStrings);
  }

  // ടോട്ടൽ തുക കണക്കാക്കുന്നു
  int getTotalAmount() {
    int total = 0;
    for (var item in wishlistStrings) {
      var parts = item.split('|'); // Name|Image|Price
      if (parts.length >= 3) {
        // ₹ ചിഹ്നം മാറ്റി നമ്പറാക്കുന്നു
        String priceString = parts[2].replaceAll('₹', '').trim();
        total += int.tryParse(priceString) ?? 0;
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"), // Wishlist എന്നതിന് പകരം Cart എന്ന് നൽകാം
        backgroundColor: Colors.green,
      ),
      body: wishlistStrings.isEmpty
          ? const Center(
              child: Text(
                "Your cart is empty!",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: wishlistStrings.length,
              itemBuilder: (context, index) {
                // ഡാറ്റ വേർതിരിക്കുന്നു (Name, Image, Price)
                var parts = wishlistStrings[index].split('|');
                String name = parts[0];
                String image = parts[1];
                String price = parts[2];

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        image,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      price,
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => removeItem(index),
                    ),
                  ),
                );
              },
            ),

      // Bottom Section with Total and Checkout Button
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Amount",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "₹${getTotalAmount()}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // ഇവിടെ പർച്ചേസ് ചെയ്യാനുള്ള ലോജിക് നൽകാം
                },
                child: const Text(
                  "Checkout Now",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}