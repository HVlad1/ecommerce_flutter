import 'package:ecommerce_flutter/blocs/wishlist/auth/bloc/auth_bloc.dart';
import 'package:ecommerce_flutter/screens/login_screen/email_form_field.dart';
import 'package:ecommerce_flutter/screens/login_screen/forgot_password.dart';
import 'package:ecommerce_flutter/screens/login_screen/password_text_field.dart';
import 'package:ecommerce_flutter/screens/screens.dart';
import 'package:ecommerce_flutter/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../colors.dart';
import '../../components/logIn_register_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'error_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const MainScreen();
        }

        if (state is AuthStateLoggedOut) {
          return Scaffold(
            backgroundColor: CustomColors.secondary,
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Logo(text: AppLocalizations.of(context)!.welcomeBack),
                  const SizedBox(
                    height: Spacings.heightSizedBoxLogIn25,
                  ),
                  const EmailTextFormField(),
                  const SizedBox(
                    height: Spacings.heightSizedBoxLogIn10,
                  ),
                  const PasswordTextField(),
                    ErrorText(),
                  ForgotPasswordAndRegisterNow(state: state,)
                ],
              ),
            )),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}







