import 'package:communitygarden/customwidgets/textformfield.dart';
import 'package:communitygarden/image/image.dart';
import 'package:communitygarden/screens/homepage/homepage.dart';
import 'package:flutter/material.dart';

class Gardensignup extends StatefulWidget {
  const Gardensignup({super.key});

  @override
  State<Gardensignup> createState() => _GardensignupState();
}

class _GardensignupState extends State<Gardensignup> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();
  String _username = "";
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: Text('EcoBloom')),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            children: [
              Center(
                child: Text(
                  'SignIn',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),

              Image.asset(AppImages.secondimage, height: 150),

              SizedBox(height: 20),
              Customwidgets(hintText: "Name", controller: namecontroller),
              SizedBox(height: 20),

              Customwidgets(hintText: "Email", controller: emailcontroller),
              SizedBox(height: 20),

              Customwidgets(hintText: "Phone", controller: phonecontroller),
              SizedBox(height: 10),

              Customwidgets(hintText: "Address", controller: addresscontroller),
              SizedBox(height: 10),

              Customwork(
                hintText: "Password",
                controller: passwordcontroller,
                icon: Icons.visibility_off_outlined,
              ),
              SizedBox(height: 20),

              Customwork(
                hintText: "Confirmpassword",
                controller: confirmpasswordcontroller,
                icon: Icons.visibility_off_outlined,
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),

              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GardenHomePage(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  side: BorderSide(color: Colors.green),
                ),
                child: Text('SignIn'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
