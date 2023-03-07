import 'package:ecommerce_flutter/components/square_icon.dart';
import 'package:ecommerce_flutter/spacing.dart';
import 'package:ecommerce_flutter/validators.dart';
import 'package:flutter/material.dart';
import '../../colors.dart';
import '../../components/logIn_register_divider.dart';
import '../../components/logIn_register_header.dart';
import '../../components/signIn_button.dart';
import '../../components/text_field.dart';
import 'forgot_password.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
                  text: AppLocalizations.of(context)!.welcomeBack,
                ),
                const SizedBox(
                  height: Spacings.heightSizedBoxLogIn25,
                ),
                CustomTextField(
                  controller: emailController,
                  validator: emailValidator,
                  labelText: AppLocalizations.of(context)!.username,
                  obscureText: false,
                ),
                const SizedBox(
                  height: Spacings.heightSizedBoxLogIn10,
                ),
                CustomTextField(
                  controller: passwordController,
                  validator: passwordValidator,
                  labelText: AppLocalizations.of(context)!.password,
                  obscureText: true,
                ),
                const SizedBox(
                  height: Spacings.heightSizedBoxLogIn10,
                ),
                const ForgotPassword(),
                const SizedBox(
                  height: Spacings.heightSizedBoxLogIn25,
                ),
                SignInButton(
                    formKey: _formKey,
                    emailController: emailController,
                    passwordController: passwordController),
                const SizedBox(
                  height: Spacings.heightSizedBoxLogIn50,
                ),
                const DividerRow(),
                const SizedBox(
                  height: Spacings.heightSizedBoxLogIn25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SquareIcon(icon: Icons.facebook),
                    SizedBox(
                      width: Spacings.widthSizedBoxLogIn25,
                    ),
                    SquareIcon(icon: Icons.apple)
                  ],
                ),
                const SizedBox(
                  height: Spacings.heightSizedBoxLogIn50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.notMember),
                    const SizedBox(
                      width: Spacings.widthSizedBoxLogIn5,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        AppLocalizations.of(context)!.registerNow,
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
