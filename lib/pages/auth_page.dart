import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:log_in_3/pages/home_page.dart';
import 'package:log_in_3/pages/log_in_page.dart';

//used to check if the user is signed in or not
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(//listening to what the user is typing
        stream: FirebaseAuth.instance.authStateChanges() ,
        builder: (context,snapshot){
          //if the user is logged in
          if(snapshot.hasData){
            return HomePage();
          }

          //user not logged in
          else{
            return LogInPage();
          }
        },),//used to listen if the user is logged in or not
    );
  }
}