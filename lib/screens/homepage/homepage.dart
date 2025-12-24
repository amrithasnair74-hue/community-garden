import 'package:communitygarden/colour/colour.dart';
import 'package:communitygarden/image/image.dart';
import 'package:communitygarden/screens/notification/notificationpage.dart';
import 'package:communitygarden/screens/registrationpage/gardenfirst.dart';
import 'package:flutter/material.dart';

class GardenHomePage extends StatelessWidget {
  const GardenHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Appcolor.backgroundcolor,

      appBar: AppBar(
        backgroundColor:Appcolor.appcolor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context,MaterialPageRoute(builder:(context)=>Gardenfirst())),
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
                MaterialPageRoute(builder: (context) =>PlantStockPage()),
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
                "Small seed, Big Community.",
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
                  buildCategory("Indoor", Icons.home),
                  buildCategory("Outdoor", Icons.park),
                  buildCategory("Herbs", Icons.eco),
                  buildCategory("Flowers", Icons.local_florist),
                ],
              ),

              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Appcolor.appcolor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Gardenfirst()),
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
}

Widget buildCategory(String title, IconData icon) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Appcolor.lightcolor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, size: 30, color:Appcolor.appcolor),
      ),
      const SizedBox(height: 6),
      Text(
        title,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    ],
  );
}








