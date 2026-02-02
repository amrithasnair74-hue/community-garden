import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          
          Stack(
            children: [
              Container(
                height: 240,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 110, 177, 8), Color.fromARGB(255, 75, 183, 99)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const Positioned(
                top: 45,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    "My Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Color.fromARGB(255, 78, 130, 64),
                      child: Icon(
                        Icons.person,
                        size: 45,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 60),

          // Profile details
          profileTile(Icons.person, "Edit profile"),
          profileTile(Icons.shopping_bag, "My cart"),
          profileTile(Icons.notification_add, "notification"),
           profileTile(Icons.lock, "Privacy & Policy"),
          profileTile(Icons.email, "nanda@aplusdesign.com"),
        

          const SizedBox(height: 20),

          // Edit Profile Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color.fromARGB(255, 123, 228, 63), Color.fromARGB(255, 66, 137, 80)],
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Center(
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileTile(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Color.fromARGB(255, 40, 171, 42)),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 14),
        ],
      ),
    );
  }
}
