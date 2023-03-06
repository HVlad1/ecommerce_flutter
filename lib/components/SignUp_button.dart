// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../colors.dart';
import '../repo/firestore_methods.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  }) : _formKey = formKey, super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(_formKey.currentState!.validate()){
          FirestoreDataService()
          .createUser(emailController, passwordController, confirmPasswordController, context);
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
            'Sign Up',
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
