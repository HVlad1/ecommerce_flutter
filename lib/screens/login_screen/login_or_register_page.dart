

import 'package:ecommerce_flutter/screens/screens.dart';
import 'package:flutter/material.dart';

import '../register_screen/register_screen.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage) {
      return LoginScreen(onTap: togglePage,);
    } else {
      return  RegisterScreen(onTap: togglePage);
    }
  }
}