// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:log_in_3/components/my_button.dart';
import 'package:log_in_3/components/my_textfield.dart';
import 'package:log_in_3/components/square_tile.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //textediting controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController=TextEditingController();

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
  void signUserUp() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: const CircularProgressIndicator());
        });
    //try creating the user
    try {
      if(passwordController.text==confirmPasswordController.text){
        //check if the confirmed password is the same
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      }
      //if they are not the same
      else{
        showErrorMessage('Password dont match');
      }
      //pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[500],
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
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(
                  height: 50,
                ),

                //welcome textview
                Text(
                  'Create  an account',
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
                const SizedBox(
                  height: 25,
                ),
                //confirm password textfield
                MyTextfield(
                  hint: 'Confirm Password',
                  controller: confirmPasswordController,
                  obsureText: true,
                ),

                //forgot password?
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text(
                //         'Forgot Password?',
                //         style: TextStyle(color: Colors.grey[600]),
                //       ),
                //     ],
                //   ),
                // ),

                const SizedBox(
                  height: 25,
                ),

                //sign in button
                MyButton(
                  onTap: signUserUp,
                  text: 'sign up',
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
                      'Alrready have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Log in now',
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
