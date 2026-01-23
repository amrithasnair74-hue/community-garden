import 'package:communitygarden/colour/colour.dart';
import 'package:communitygarden/image/image.dart';
import 'package:flutter/material.dart';

class Internalpage extends StatefulWidget {
  const Internalpage({super.key});

  @override
  State<Internalpage> createState() => _InternalpageState();
}

class _InternalpageState extends State<Internalpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.backgroundcolor,
      appBar: AppBar(
        backgroundColor: Appcolor.appcolor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "EcoBloom",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
        
          Image.asset(
            AppImages.splashimage,
            height: 100,
            
            fit: BoxFit.cover,
          ),

          
           Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                ListTile(
                
                  title: Text("Water the plants"),
                  subtitle: Text("150 ml of water"),
                ),
                ListTile(
                  leading: Icon(Icons.eco),
                  title: Text("Add fertilizer"),
                  subtitle: Text("Once a week"),
                ),
                ListTile(
                  leading: Icon(Icons.eco),
                  title: Text("Sunlight"),
                  subtitle: Text("6 hours daily"),
                ),
                ListTile(
                  leading: Icon(Icons.eco),
                  title: Text("Pruning"),
                  subtitle: Text("Remove dry leaves"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}