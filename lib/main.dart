import 'package:communitygarden/screens/aboutpage/aboutpage.dart';
import 'package:communitygarden/screens/aboutpage/aboutrose.dart';
import 'package:communitygarden/screens/aboutpage/aboutshrub.dart';
import 'package:communitygarden/screens/detailedpage/detailedpage.dart';
import 'package:communitygarden/screens/homepage/homepage.dart';
import 'package:communitygarden/screens/internalpage/internalpage.dart';
import 'package:communitygarden/screens/notification/notificationpage.dart';
import 'package:communitygarden/screens/payementpage.dart';
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
      home:Gardensplash() ,
    );
  }
}
class communitygarden extends StatefulWidget {
  const communitygarden({super.key});

  @override
  State<communitygarden> createState() => _communitygardenState();
}

class _communitygardenState extends State<communitygarden> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }  
}