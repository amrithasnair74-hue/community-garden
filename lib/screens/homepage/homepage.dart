import 'package:flutter/material.dart';

/// MODEL
class Plant {
  final String name;
  final String price;
  final String image;

  Plant({required this.name, required this.price, required this.image});

  /// IMPORTANT: equality override
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Plant &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          image == other.image;

  @override
  int get hashCode => name.hashCode ^ image.hashCode;
}

/// GLOBAL LISTS
List<Plant> cartItems = [];
List<Plant> favItems = [];

/// SAMPLE DATA
List<Plant> plants = [
  Plant(name: "money Plant", price: "₹499", image: "assets/moneyplant.jpg"),
  Plant(name: "Monstera", price: "₹350", image: "assets/line leafy.jpg"),
  Plant(name: "Oleander", price: "₹400", image: "assets/arali.jpg"),
  Plant(name: "Bougainvillea", price: "₹400", image: "assets/boganvilla.jpg"),
  Plant(name: "Mint", price: "₹200", image: "assets/mohra.jpg"),
  Plant(name: "snakeplant", price: "₹400", image: "assets/leaves.jpg"),
  Plant(name: "rose", price: "₹400", image: "assets/red.jpg"),
  Plant(name: "rose2", price: "₹400", image: "assets/kattarvazha.jpg"),
  Plant(name: "Aloe Vera", price: "₹400", image: "assets/hibiscus.jpg"),
  Plant(name: "jasmin", price: "₹400", image: "assets/jasmin.jpg"),
  Plant(name: "corriander", price: "₹400", image: "assets/malliyila.jpg"),
  Plant(name: "orange", price: "₹400", image: "assets/orange.jpg"),
  Plant(name: "orange spling", price: "₹400", image: "assets/orange.jpg"),
  Plant(name: "yelllow sping", price: "₹400", image: "assets/yellow.jpg"),
  Plant(name: "African corriander", price: "₹400", image: "assets/grimp.jpg"),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void openCart(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CartPage()),
    );
  }

  void openFav(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => FavoritesPage()),
    );
  }

  void openDetail(BuildContext context, Plant plant) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PlantDetailPage(plant: plant),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EcoBloom"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => openFav(context),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => openCart(context),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: plants.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.72,
        ),
        itemBuilder: (context, index) {
          final plant = plants[index];
          final isFav = favItems.contains(plant);

          return InkWell(
            onTap: () => openDetail(context, plant),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 6,
                    color: Colors.black12,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(18)),
                          child: Image.asset(
                            plant.image,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (favItems.contains(plant)) {
                                  favItems.remove(plant);
                                } else {
                                  favItems.add(plant);
                                }
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                isFav
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    plant.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(plant.price),
                  const SizedBox(height: 6),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(120, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      cartItems.add(plant);
                      openCart(context);
                    },
                    child: const Text("Add to Cart"),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: favItems.isEmpty
          ? const Center(child: Text("No Favorites"))
          : ListView.builder(
              itemCount: favItems.length,
              itemBuilder: (_, i) {
                final item = favItems[i];
                return ListTile(
                  leading: Image.asset(item.image, width: 50),
                  title: Text(item.name),
                  subtitle: Text(item.price),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        favItems.remove(item);
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  double getTotal() {
    double total = 0;
    for (var item in cartItems) {
      total += double.parse(item.price.replaceAll("₹", ""));
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: cartItems.isEmpty
          ? const Center(child: Text("Cart is Empty"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (_, i) {
                      final item = cartItems[i];
                      return ListTile(
                        leading: Image.asset(item.image, width: 50),
                        title: Text(item.name),
                        subtitle: Text(item.price),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              cartItems.remove(item);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),

                /// TOTAL
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "Total: ₹${getTotal()}",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Checkout"),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}

class PlantDetailPage extends StatelessWidget {
  final Plant plant;

  const PlantDetailPage({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(plant.name)),
      body: Center(child: Text(plant.name)),
    );
  }
}