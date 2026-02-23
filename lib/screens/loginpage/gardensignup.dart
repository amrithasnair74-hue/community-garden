import 'package:communitygarden/bottomnavigation.dart';
import 'package:communitygarden/customwidgets/textformfield.dart';
import 'package:communitygarden/image/image.dart';
import 'package:communitygarden/screens/homepage/homepage.dart';
import 'package:communitygarden/screens/payementpage.dart';
import 'package:flutter/material.dart';

class Gardensignup extends StatefulWidget {
  const Gardensignup({super.key});

  @override
  State<Gardensignup> createState() => _GardensignupState();
}

class _GardensignupState extends State<Gardensignup> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();

  @override
  void dispose() {
    namecontroller.dispose();
    passwordcontroller.dispose();
    emailcontroller.dispose();
    phonecontroller.dispose();
    addresscontroller.dispose();
    confirmpasswordcontroller.dispose();
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
                    'SignIn',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Image.asset(AppImages.secondimage, height: 150),
                const SizedBox(height: 20),

                Customwidgets(
                  hintText: "Name",
                  controller: namecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Please enter your name";
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                Customwidgets(
                  hintText: "Email",
                  controller: emailcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Please enter email";
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return "Enter a valid email address";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                Customwidgets(
                  hintText: "Phone",
                  controller: phonecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Please enter phone number";
                    if (value.length < 10)
                      return "Enter a valid 10-digit number";
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                Customwidgets(
                  hintText: "Address",
                  controller: addresscontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Please enter address";
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                Customwork(
                  hintText: "Password",
                  controller: passwordcontroller,
                  icon: Icons.visibility_off_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Please enter password";
                    if (!RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                    ).hasMatch(value)) {
                      return "Password must include 8 char Upper, Lower, Number & Special char";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                Customwork(
                  hintText: "Confirmpassword",
                  controller: confirmpasswordcontroller,
                  icon: Icons.visibility_off_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Confirm your password";
                    if (value != passwordcontroller.text)
                      return "Passwords do not match";
                    return null;
                  },
                ),
                const SizedBox(height: 40),

                OutlinedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    side: const BorderSide(color: Colors.green),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('SignIn'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
