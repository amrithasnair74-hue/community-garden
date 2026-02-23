
import 'package:communitygarden/bottomnavigation.dart';
import 'package:communitygarden/payement.dart';
import 'package:communitygarden/screens/homepage/homepage.dart';
import 'package:communitygarden/screens/splashscreen/gardensplash.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyWidget());
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home:Gardensplash(),
    );
  }
}
class communitygarden extends StatefulWidget {
  const communitygarden({super.key});

  @override
  State<communitygarden> createState() => communitygardenState();
}

class communitygardenState extends State<communitygarden> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }  
}