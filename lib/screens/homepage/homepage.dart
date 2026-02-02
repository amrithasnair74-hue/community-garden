import 'package:communitygarden/colour/colour.dart';
import 'package:communitygarden/image/image.dart';
import 'package:communitygarden/screens/aboutpage/aboutpage.dart';
import 'package:communitygarden/screens/detailedpage/detailedpage.dart';
import 'package:communitygarden/screens/notification/notificationpage.dart';
import 'package:flutter/material.dart';

class GardenHomePage extends StatelessWidget {
  const GardenHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.backgroundcolor,
      appBar: AppBar(
        backgroundColor: Appcolor.appcolor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "EcoBloom",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlantStockPage()),
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Center(
                child: Image.asset(
                  AppImages.homepage,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Welcome to EcoBloom 🌱",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Small Seed, Big Community.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: "Search plants, tips, tools...",
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCategory(context, "Indoor", Icons.home),
                  buildCategory(context, "Outdoor", Icons.park),
                  buildCategory(context, "Herbs", Icons.eco),
                  buildCategory(context, "Flowers", Icons.local_florist),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Appcolor.appcolor,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const DetailPage()),
                    );
                  },
                  child: const Text(
                    "View Plants",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategory(BuildContext context, String title, IconData icon) {
    return InkWell(
      onTap: () {
        if (title == "Indoor") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const IndoorPlantsPage()));
        } else if (title == "Outdoor") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const OutdoorPlantsPage()));
        } else if (title == "Herbs") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HerbsPage()));
        } else if (title == "Flowers") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const FlowersPage()));
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Appcolor.lightcolor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 30, color: Appcolor.appcolor),
          ),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------------
// INDOOR PLANTS PAGE - Updated with Asset Paths
// ----------------------------------------------------------------------
class IndoorPlantsPage extends StatelessWidget {
  const IndoorPlantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> indoorPlants = [
      {"name": "Snake Plant", "image": "assets/moneyplant.jpg"},
      {"name": "tropica", "image": "assets/line leafy.jpg"},
      {"name": "pink arali", "image": "assets/anthurium.jpg"},
      {"name": "snake plant", "image": "assets/leaves.jpg"},
      {"name": "indoor plant", "image": "assets/mohra.jpg"},
      {"name": "Peace Lily", "image": "assets/rosy.jpg"},
      {"name": "moneyplants", "image": "assets/shrubs.jpg"},
      {"name":"anthurium","image":"assets/anthurium.jpg"}
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Indoor Plants"), backgroundColor: Appcolor.appcolor),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.8,
        ),
        itemCount: indoorPlants.length,
        itemBuilder: (context, index) => plantCard(indoorPlants[index]["name"]!, indoorPlants[index]["image"]!),
      ),
    );
  }
}

// ----------------------------------------------------------------------
// OUTDOOR PLANTS PAGE - Updated with Asset Paths
// ----------------------------------------------------------------------
class OutdoorPlantsPage extends StatelessWidget {
  const OutdoorPlantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> outdoorPlants = [
       {"name": "white dalia", "image": "assets/white.jpg"},
      {"name": "Sunflowers", "image": "assets/sunflower.jpg"},
      {"name": "arali", "image": "assets/arali.jpg"},
      {"name": "jasmin", "image": "assets/jasmin.jpg"},
      {"name": "Rose Bush", "image": "assets/rose.jpg"},
      {"name": "Garden Fern", "image": "assets/shrubs.jpg"},
      {"name": "lavender", "image": "assets/lavender.jpg"},
      {"name": "Garden Fern", "image": "assets/orange.jpg"},
      {"name": "Rose Bush", "image": "assets/red.jpg"},
      {"name": "Garden Fern", "image": "assets/hibiscus.jpg"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Outdoor Plants"), backgroundColor: Appcolor.appcolor),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.8,
        ),
        itemCount: outdoorPlants.length,
        itemBuilder: (context, index) => plantCard(outdoorPlants[index]["name"]!, outdoorPlants[index]["image"]!),
      ),
    );
  }
}

// ----------------------------------------------------------------------
// HERBS PAGE - Updated with Asset Paths
// ----------------------------------------------------------------------
class HerbsPage extends StatelessWidget {
  const HerbsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> herbs = [
      {"name": "Basil", "image": "assets/thulip.jpg"},
      {"name": "Basil", "image": "assets/kattarvazha.jpg"},
       {"name": "Rosemerry", "image": "assets/rosemerry.jpg"},
        {"name": "leafy", "image": "assets/corriander.jpg"},
      {"name": "Rosemary", "image": "assets/thulsi.jpg"},
      {"name": "Mint", "image": "assets/grimp.jpg"},
      {"name": "Thyme", "image": "assets/corriander.jpg"},
      {"name": "Rosemerry", "image": "assets/kattarvazha.jpg"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Herbs"), backgroundColor: Appcolor.appcolor),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.8,
        ),
        itemCount: herbs.length,
        itemBuilder: (context, index) => plantCard(herbs[index]["name"]!, herbs[index]["image"]!),
      ),
    );
  }
}

// ----------------------------------------------------------------------
// FLOWERS PAGE - Updated with Asset Paths
// ----------------------------------------------------------------------
class FlowersPage extends StatelessWidget {
  const FlowersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> flowers = [
      {"name": "Pink arali", "image": "assets/arali.jpg"},
      {"name": "Marigold", "image": "assets/orange.jpg"},
      {"name": "jasmin", "image": "assets/jasmin.jpg"},
      {"name": "Lily", "image": "assets/anthurium.jpg"},
       {"name": "Rose", "image": "assets/red.jpg"},
        {"name": "pink rose", "image": "assets/rose.jpg"},
         {"name": "Boganvilla", "image": "assets/boganvilla.jpg"},
          {"name": "Hibiscus", "image": "assets/hibiscus.jpg"},
          {"name": "Pink arali", "image": "assets/arali.jpg"},
           {"name": "Lily", "image": "assets/anthurium.jpg"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Flowers"), backgroundColor: Appcolor.appcolor),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.8,
        ),
        itemCount: flowers.length,
        itemBuilder: (context, index) => plantCard(flowers[index]["name"]!, flowers[index]["image"]!),
      ),
    );
  }
}

// ----------------------------------------------------------------------
// UPDATED PLANT CARD WIDGET
// ----------------------------------------------------------------------
Widget plantCard(String name, String imagePath) { // Changed name from imageUrl to imagePath
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5, spreadRadius: 2)],
    ),
    child: Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            // CHANGED HERE: Image.network -> Image.asset
            child: Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
      ],
    ),
  );
}