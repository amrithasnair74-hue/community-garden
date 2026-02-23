import 'package:communitygarden/colour/colour.dart';
import 'package:communitygarden/screens/detailedpage/detailedpage.dart';
import 'package:communitygarden/screens/homepage/homepage.dart' hide Appcolor;
import 'package:communitygarden/screens/notification/notificationpage.dart';
import 'package:communitygarden/settings/settingspage.dart';
import 'package:flutter/material.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  int selectedindex = 0;
  final List<Widget> pages = [
    HomePage(),
    ProfilePage(),
    
    PlantStockPage(),
  ];
  void itemtap(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
        ],
        selectedItemColor: Appcolor.appcolor,
        unselectedItemColor: Colors.black,
        currentIndex: selectedindex,
        onTap: itemtap,
        showSelectedLabels: true,
      ),
    );
  }
}
