import 'package:ecommerce_flutter/components/square_icon.dart';
import 'package:ecommerce_flutter/themes.dart';
import 'package:ecommerce_flutter/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../colors.dart';
import '../../components/SignUp_button.dart';
import '../../components/text_field.dart';
import '../../spacing.dart';

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
                const Logo(),
                const SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  controller: emailController,
                  validator: emailValidator,
                  labelText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: passwordController,
                  validator: addressValidator,
                  labelText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: confirmPasswordController,
                  validator: addressValidator,
                  labelText: 'Confirm password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 25,
                ),
                //   SignInButton(onTap: signUserIn),
                SignUpButton(
                  formKey: _formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                ),
                const SizedBox(
                  height: 50,
                ),
                const DividerRow(),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SquareIcon(icon: Icons.facebook),
                    SizedBox(
                      width: 25,
                    ),
                    SquareIcon(icon: Icons.apple)
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account'),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
                        style: TextStyle(
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

class RegisterNow extends StatelessWidget {
  const RegisterNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Not a member?'),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          child: const Text(
            'Register now',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

class DividerRow extends StatelessWidget {
  const DividerRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          const Expanded(
              child: Divider(
            thickness: 0.5,
            color: CustomColors.primary,
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Or continue with',
              style: AppThemeData()
                  .appThemeData
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Colors.grey[700]),
            ),
          ),
          const Expanded(
              child: Divider(
            thickness: 0.5,
            color: CustomColors.primary,
          )),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Center(
          child: Container(
            color: CustomColors.primary,
            padding: Spacings.paddingCustomAppBar,
            child: Text(
              AppLocalizations.of(context)!.appname,
              style: AppThemeData().appThemeData.appBarTheme.titleTextStyle,
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Text('Let\'s create an account for you!',
            style: AppThemeData()
                .appThemeData
                .textTheme
                .headline3
                ?.copyWith(color: Colors.grey[700])),
      ],
    );
  }
}
