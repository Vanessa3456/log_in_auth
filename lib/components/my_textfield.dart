import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  String hint;
  final  controller;//what we can use to acess what the user typed in the textfield
  final bool obsureText;
  MyTextfield(
      {super.key,
      required this.hint,
      required this.controller,
      required this.obsureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText:obsureText, //to hide the characters when typing the password,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[500])
        ),
      ),
    );
  }
}
