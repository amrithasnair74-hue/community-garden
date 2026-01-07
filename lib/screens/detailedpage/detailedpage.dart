import 'package:communitygarden/colour/colour.dart';
import 'package:communitygarden/image/image.dart';
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
      {'isHeader': true, 'title': ' EcoBloom'},

      {
        'isHeader': false,
        'image': AppImages.shrubimage,
        'title': 'Create with EcoBloom ',
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
        actions: const [
        
          SizedBox(width: 12),
        ],
      ),

      
      
      
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        
        child: SizedBox(
          height: 60,
        
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){ Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const GardenHomePage ()),
                    );}, icon:Icon(Icons.home ),),
              IconButton(onPressed: (){ Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const PlantStockPage ()),
                    );

              }, icon: Icon(Icons.notification_add_rounded)),
             IconButton(onPressed: (){
               Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ShrubPage ()),
                    );
             }, icon: Icon(Icons.settings)),
             IconButton(onPressed: (){
               Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RosePage ()),
                    );
             }, icon: Icon(Icons.heart_broken_rounded)),
              
              
            ],
          ),
        ),
      ),

      /// BODY
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            /// HEADER
            if (item['isHeader'] == true) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: item['title'].toString().contains("EcoBloom")
                            ? "New on "
                            : item['title'],
                      ),
                      if (item['title'].toString().contains("EcoBloom"))
                        const TextSpan(
                          text: "EcoBloom",
                          style: TextStyle(color: Color(0xff4C8C4A)),
                        ),
                    ],
                  ),
                ),
              );
            }

          
            return Container(
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
                            height: 1.2,
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
            );
          },
        ),
      ),
    );
  }
}