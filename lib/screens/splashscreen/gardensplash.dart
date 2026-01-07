import 'package:communitygarden/colour/colour.dart';
import 'package:communitygarden/image/image.dart';
import 'package:communitygarden/screens/registrationpage/gardenfirst.dart';
import 'package:flutter/material.dart';

class Gardensplash extends StatefulWidget {
  const Gardensplash({super.key});

  @override
  State<Gardensplash> createState() => _GardensplashState();
}

class _GardensplashState extends State<Gardensplash> {
  void initState() {
    navigateHome();
    super.initState();
  }

  navigateHome() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Gardenfirst()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.backgroundcolor,
      body: Center(child: Image.asset(AppImages.splashimage, height: 200)),
    );
  }
}
