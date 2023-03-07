import 'package:ecommerce_flutter/components/square_icon.dart';
import 'package:ecommerce_flutter/spacing.dart';
import 'package:ecommerce_flutter/validators.dart';
import 'package:flutter/material.dart';
import '../../colors.dart';
import '../../components/SignUp_button.dart';
import '../../components/logIn_register_divider.dart';
import '../../components/logIn_register_header.dart';
import '../../components/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatefulWidget {
  final Function()? onTap;
  const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                CustomTextField(
                  controller: passwordController,
                  validator: passwordValidator,
                  labelText: AppLocalizations.of(context)!.password,
                  obscureText: true,
                ),
                const SizedBox(
                  height: Spacings.heightSizedBoxLogIn10,
                ),
                CustomTextField(
                  controller: confirmPasswordController,
                  validator: passwordValidator,
                  labelText: AppLocalizations.of(context)!.confirmPassword,
                  obscureText: true,
                ),
                const SizedBox(
                  height: Spacings.heightSizedBoxLogIn25,
                ),
                SignUpButton(
                  formKey: _formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                ),
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
                    Text(AppLocalizations.of(context)!.alreadyHaveAccount),
                    const SizedBox(
                      width: Spacings.widthSizedBoxLogIn5,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
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
