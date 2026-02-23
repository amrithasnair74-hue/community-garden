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
                
                  title: Text("special offer for you"),
                  subtitle: Text("25% off"),
                ),
                ListTile(
                  leading: Icon(Icons.eco),
                  title: Text("special offer for you"),
                  subtitle: Text("10% discount"),
                ),
                ListTile(
                  leading: Icon(Icons.eco),
                  title: Text("exclusive offer"),
                  subtitle: Text("100rs reduction from actual price"),
                ),
                ListTile(
                  leading: Icon(Icons.eco),
                  title: Text("only for you"),
                  subtitle: Text("50% off"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}