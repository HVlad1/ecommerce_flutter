// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../colors.dart';
import '../repo/firestore_methods.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.passwordController,
  }) : _formKey = formKey, super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(_formKey.currentState!.validate()){
          FirestoreDataService()
          .signUserIn(emailController, passwordController, context);
        } else {
          const SizedBox();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(25.0),
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10.0)),
        child: const Center(
          child: Text(
            'Sign In',
            style: TextStyle(
                color: CustomColors.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
