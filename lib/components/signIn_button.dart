// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../colors.dart';
import '../repo/firestore_methods.dart';
import '../spacing.dart';

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
        padding: Spacings.paddingContainerSignInButton,
        margin: Spacings.marginContainerSignInButton,
        decoration: BoxDecoration(
            color: CustomColors.primary,
            borderRadius: Spacings.borderRadiusSignInButton),
        child:  Center(
          child: Text(
            AppLocalizations.of(context)!.signIn,
            style: const TextStyle(
                color: CustomColors.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}
