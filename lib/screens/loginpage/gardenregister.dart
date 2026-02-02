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
  // 1. Create a GlobalKey to identify the Form
  final _formKey = GlobalKey<FormState>();

  // 2. Separate controllers for each field
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    usernamecontroller.dispose();
    passwordcontroller.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: const Text('EcoBloom')),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // 3. Wrap your Column in a Form widget
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

                // Name Validation
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

                // Password Validation
                Customwidgets(
                  hintText: "Password",
                  controller: passwordcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Password";
                    }
                    // Your Regex for: 1 Upper, 1 Lower, 1 Digit, 1 Special Char, Min 8 chars
                    if (!RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                    ).hasMatch(value)) {
                      return "Password must be 8+ chars (Upper, Lower, Number, Special)";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),

                // Confirm Password Validation
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
                    // 4. Trigger validation logic
                    if (_formKey.currentState!.validate()) {
                      // If form is valid, navigate to homepage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GardenHomePage(),
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text("forgot password ?"),
                    ),
                    TextButton(onPressed: () {}, child: const Text("Create Account")),
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