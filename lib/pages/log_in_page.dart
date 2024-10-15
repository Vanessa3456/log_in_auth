// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:log_in_3/components/my_button.dart';
import 'package:log_in_3/components/my_textfield.dart';
import 'package:log_in_3/components/square_tile.dart';

class LogInPage extends StatefulWidget {
  final Function()? onTap;
  LogInPage({super.key, required this.onTap});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  //textediting controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //wrong email message
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text(message)),
        );
      },
    );
  }

  //sign in
  void signUserIn() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: const CircularProgressIndicator());
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      //pop the loading circle
      if (mounted) {
        Navigator.pop(context); // Pop the loading circle
      }
    } on FirebaseAuthException catch (e) {
if (mounted) {
      Navigator.pop(context); // Pop the loading circle
    }      showErrorMessage(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                //logo
                const Icon(
                  Icons.account_circle,
                  size: 100,
                ),

                const SizedBox(
                  height: 50,
                ),

                //welcome textview
                Text(
                  'Welcome back',
                  style: TextStyle(color: Colors.grey[700], fontSize: 20),
                ),

                const SizedBox(
                  height: 25,
                ),

                //email textfield
                MyTextfield(
                  hint: 'email',
                  controller: emailController,
                  obsureText: false,
                ),

                const SizedBox(
                  height: 25,
                ),

                //password textfield
                MyTextfield(
                  hint: 'Password',
                  controller: passwordController,
                  obsureText: true,
                ),

                //forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                //sign in button
                MyButton(
                  onTap: signUserIn,
                  text: 'Log In',
                ),

                const SizedBox(
                  height: 50,
                ),

                //or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                //google+apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: 'lib/images/googlelogo.png'),
                    const SizedBox(width: 10),
                    SquareTile(imagePath: 'lib/images/applelogo.png'),
                  ],
                ),

                const SizedBox(
                  height: 50,
                ),

                //not a member?register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Register now',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
