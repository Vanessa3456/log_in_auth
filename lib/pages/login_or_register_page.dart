import 'package:flutter/material.dart';
import 'package:log_in_3/pages/log_in_page.dart';
import 'package:log_in_3/pages/register_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}



class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  //initially show the login page
bool showLoginPage=true;

//toggle between register and login
void togglePages(){
  setState(() {
    showLoginPage =!showLoginPage;
  });
}
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LogInPage(onTap: togglePages,);
    }
    else{
      return RegisterPage(onTap: togglePages,);
    }
  }
}