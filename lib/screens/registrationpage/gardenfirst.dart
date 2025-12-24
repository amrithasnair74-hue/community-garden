import 'package:communitygarden/colour/colour.dart';
import 'package:communitygarden/image/image.dart';
import 'package:communitygarden/screens/loginpage/gardenregister.dart';
import 'package:communitygarden/screens/loginpage/gardensignup.dart';
import 'package:flutter/material.dart';

class Gardenfirst extends StatefulWidget {
  const Gardenfirst({super.key});

  @override
  State<Gardenfirst> createState() => _GardenfirstState();
}

class _GardenfirstState extends State<Gardenfirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.appcolor,
        title: const Text("EcoBloom"),
        centerTitle: true,
      ),
      backgroundColor:Appcolor.backgroundcolor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),

              Image.asset(AppImages.firstimage, height: 150),
              const SizedBox(height: 30),

              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Gardenregister(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Appcolor.backcolor,
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 18,color:Colors.green),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("OR"),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Gardensignup(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Appcolor.backcolor,
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text(
                    "Signup",
                    style: TextStyle(fontSize: 18, color: Colors.green),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
