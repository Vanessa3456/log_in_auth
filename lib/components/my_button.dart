// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
 
  MyButton({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Colors.black54, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            'Sign in',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
