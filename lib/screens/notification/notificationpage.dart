import 'package:communitygarden/colour/colour.dart';
import 'package:flutter/material.dart';

class PlantStockPage extends StatelessWidget {
  const PlantStockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.backgroundcolor,
      appBar: AppBar(
        backgroundColor: Appcolor.appcolor,
        title: const Text(
          "Notification",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              children: [
                topIcon("Flowering Plants", Icons.local_florist),
                topIcon("Indoor Plants", Icons.grass),
                topIcon("outdoor Plants", Icons.eco),
                topIcon("Trees", Icons.forest),
                topIcon("Bushes", Icons.spa),
                topIcon("Shrubs", Icons.park_outlined),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(14),
              children: [
                plantCard(
                  name: "Red Rose",
                  offer: "Special discount",
                  icon: Icons.local_florist,
                ),
                plantCard(
                  name: "Boganvilla",
                  offer: "Limited Stock",
                  icon: Icons.park,
                ),
                plantCard(
                  name: "Ugaoo",
                  offer: "Limited Stock",
                  icon: Icons.eco,
                ),
                plantCard(
                  name: "Aglaonema",
                  offer: "Buy one Get one Free",
                  icon: Icons.eco_outlined,
                ),
                plantCard(
                  name: "Peace Lilly",
                  offer: "10% off",
                  icon: Icons.spa,
                ),
                plantCard(
                  name: "Marantana",
                  offer: "25% off",
                  icon: Icons.local_florist,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget topIcon(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Column(
      children: [
        Icon(icon, size: 28, color: Appcolor.backgroundcolor),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: Colors.white)),
      ],
    ),
  );
}

Widget plantCard({
  required String name,
  required String offer,
  required IconData icon,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Appcolor.appcolor,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: 35, color: Appcolor.backgroundcolor),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  offer,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
