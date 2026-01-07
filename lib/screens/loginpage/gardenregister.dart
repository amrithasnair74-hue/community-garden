import 'package:communitygarden/customwidgets/textformfield.dart';
import 'package:communitygarden/image/image.dart';
import 'package:communitygarden/screens/homepage/homepage.dart';
import 'package:flutter/material.dart';

class Gardenregister extends StatefulWidget {
  const Gardenregister({super.key});

  @override
  State<Gardenregister> createState() => _GardenregisterState();
}

class _GardenregisterState extends State<Gardenregister> {
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

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
                  'Login',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),

              Image.asset(AppImages.thirdimage, height: 150),

              SizedBox(height: 20),
              Customwidgets(
                hintText: "Name",
                controller: usernamecontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter name";
                  }
                  return null;
                },
              ),

              SizedBox(height: 10),
              Customwidgets(
                hintText: "Password",
                controller: passwordcontroller,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter Password";
                  }
                  if (!RegExp(
                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                  ).hasMatch(value)) {
                    return "enter correct password";
                  }
                  return null;
                },
              ),

              SizedBox(height: 10),

              Customwidgets(
                hintText: "Confirm password",
                controller: passwordcontroller,
              ),
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
                    borderRadius: BorderRadius.circular(15), // fixed
                  ),
                  side: BorderSide(color: Colors.green),
                ),
                child: Text('login'),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text("forgot password ?"),
                  ),
                  TextButton(onPressed: () {}, child: Text("Create Account")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
