import 'package:flutter/material.dart';

class Customwidgets extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  final String?Function(String?)?validator;

  const Customwidgets({super.key, required this.hintText, required this.controller,  this.validator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator:validator ,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: hintText,
      

      ),
    );
  }
}
class Customwork extends StatelessWidget {
   final String hintText;
  final TextEditingController controller;

  final String?Function(String?)?validator;
  final IconData icon;

   const Customwork({
    super.key, 
  required this.hintText, 
  required this.controller,
  this.validator, required this.icon
   });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator:validator ,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: hintText,
        suffixIcon: Icon(icon),


      ),
    );
  }
}