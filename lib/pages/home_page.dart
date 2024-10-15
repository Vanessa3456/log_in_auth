import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:log_in_3/pages/log_in_page.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  final user=FirebaseAuth.instance.currentUser!;

  //sign user out

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        title: Text(
          'Home page',
        ),
        actions: [
          IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(child: Text('Logged in successfully as' + user.email!)),
    );
  }
}
