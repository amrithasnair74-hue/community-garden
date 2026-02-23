import 'package:communitygarden/bottomnavigation.dart';
import 'package:communitygarden/customwidgets/textformfield.dart';
import 'package:communitygarden/image/image.dart';
import 'package:communitygarden/screens/homepage/homepage.dart';
import 'package:communitygarden/screens/loginpage/gardenforgotpassword.dart';
import 'package:communitygarden/screens/loginpage/gardensignup.dart';
import 'package:flutter/material.dart';

class Gardenregister extends StatefulWidget {
  const Gardenregister({super.key});

  @override
  State<Gardenregister> createState() => _GardenregisterState();
}

class _GardenregisterState extends State<Gardenregister> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    usernamecontroller.dispose();
    passwordcontroller.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('EcoBloom'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),

                Image.asset(AppImages.thirdimage, height: 150),

                const SizedBox(height: 20),

                Customwidgets(
                  hintText: "Name",
                  controller: usernamecontroller,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),

                Customwidgets(
                  hintText: "Password",
                  controller: passwordcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Password";
                    }
                    if (!RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                    ).hasMatch(value)) {
                      return "Password must be 8+ chars (Upper, Lower, Number, Special)";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),

                Customwidgets(
                  hintText: "Confirm password",
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm your password";
                    }
                    if (value != passwordcontroller.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                OutlinedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Bottomnavigation(),
                        ),
                      );
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    side: const BorderSide(color: Colors.green),
                  ),
                  child: const Text('Login'),
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GardenForgotPassword(),
                          ),
                        );
                      },
                      child: const Text("Forgot Password?"),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Gardensignup(),
                          ),
                        );
                      },
                      child: const Text("Create Account"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
