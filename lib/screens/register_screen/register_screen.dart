import 'package:ecommerce_flutter/blocs/wishlist/auth/bloc/auth_bloc.dart';
import 'package:ecommerce_flutter/screens/login_screen/email_and_password_controller.dart';
import 'package:ecommerce_flutter/screens/register_screen/password_text_field_register.dart';
import 'package:ecommerce_flutter/screens/screens.dart';
import 'package:ecommerce_flutter/spacing.dart';
import 'package:ecommerce_flutter/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../colors.dart';
import '../../components/button_login_register.dart';
import '../../components/logIn_register_header.dart';
import '../../components/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondary,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Logo(
                  text: AppLocalizations.of(context)!.createAccount,
                ),
                const SizedBox(
                  height: Spacings.heightSizedBoxLogIn25,
                ),
                CustomTextField(
                  controller: emailController,
                  validator: emailValidator,
                  labelText: AppLocalizations.of(context)!.checkoutEmail,
                  obscureText: false,
                ),
                const SizedBox(
                  height: Spacings.heightSizedBoxLogIn10,
                ),
                const PasswordTextFieldRegister(),
                const SizedBox(
                  height: Spacings.heightSizedBoxLogIn10,
                ),
                const SizedBox(
                  height: Spacings.heightSizedBoxLogIn25,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return ButtonRegister(
                      state: state,
                      name: AppLocalizations.of(context)!.signUp,
                    );
                  },
                ),
                const SizedBox(
                  height: Spacings.heightSizedBoxLogIn50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.alreadyHaveAccount),
                    const SizedBox(
                      width: Spacings.widthSizedBoxLogIn5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: Text(
                        AppLocalizations.of(context)!.loginNow,
                        style: const TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
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
