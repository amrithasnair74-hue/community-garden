import 'package:communitygarden/colour/colour.dart';
import 'package:communitygarden/image/image.dart';
import 'package:communitygarden/screens/aboutpage/aboutpinkrose.dart';
import 'package:communitygarden/screens/aboutpage/aboutrose.dart';
import 'package:communitygarden/screens/aboutpage/aboutshrub.dart';
import 'package:communitygarden/screens/homepage/homepage.dart';
import 'package:communitygarden/screens/notification/notificationpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailPage(),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {'isHeader': true, 'title': 'EcoBloom'},

      {
        'isHeader': false,
        'image': AppImages.shrubimage,
        'title': 'Create with EcoBloom',
        'sub': '150 ml',
        'active': true,
        'color': const Color.fromARGB(255, 189, 164, 142),
      },
      {
        'isHeader': false,
        'image': AppImages.boganimage,
        'title': 'Create with EcoBloom',
        'sub': '150 ml',
        'active': true,
        'color': const Color(0xffE9C6AB),
      },
      {
        'isHeader': false,
        'image': AppImages.redrose,
        'title': 'Create with EcoBloom',
        'sub': '150 ml',
        'active': false,
        'color': const Color.fromARGB(255, 163, 180, 194),
      },
      {
        'isHeader': false,
        'image': AppImages.waterimage,
        'title': 'Create with EcoBloom',
        'sub': '150 ml',
        'active': false,
        'color': const Color(0xffEAEAEA),
      },
      {
        'isHeader': false,
        'image': AppImages.boganimage,
        'title': 'Create with EcoBloom',
        'sub': '150 ml',
        'active': true,
        'color': const Color.fromARGB(255, 151, 186, 128),
      },
      {
        'isHeader': false,
        'image': AppImages.roseimage,
        'title': 'Create with EcoBloom',
        'sub': '150 ml',
        'active': true,
        'color': const Color(0xffE9C6AB),
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const GardenHomePage()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const PlantStockPage()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ShrubPage()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const RosePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            
            if (item['isHeader'] == true) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: RichText(
                  text: const TextSpan(
                    text: "New on ",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "EcoBloom",
                        style: TextStyle(color: Color(0xff4C8C4A)),
                      ),
                    ],
                  ),
                ),
              );
            }

          
            return InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () {
                if (item['image'] == AppImages.shrubimage) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ShrubPage()),
                  );
                } else if (item['image'] == AppImages.redrose ||
                    item['image'] == AppImages.redrose) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const RosePage()),

                  );
                }
                else if (item['image'] == AppImages.roseimage ||
                    item['image'] == AppImages.roseimage) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const Aboutpinkrose()),);}
              },
              child: Container(
                height: 100,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: item['color'],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 20),

                    Image.asset(
                      item['image'],
                      height: 65,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.water_drop_outlined,
                                  size: 14, color: Colors.black45),
                              const SizedBox(width: 4),
                              Text(
                                item['sub'],
                                style: const TextStyle(
                                    color: Colors.black45, fontSize: 13),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        item['active']
                            ? Icons.check
                            : Icons.water_drop_outlined,
                        color: item['active']
                            ? Colors.white
                            : Colors.blue.withOpacity(0.5),
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}