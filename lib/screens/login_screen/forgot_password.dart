import 'package:ecommerce_flutter/screens/login_screen/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../blocs/wishlist/auth/bloc/auth_bloc.dart';
import '../../colors.dart';
import '../../spacing.dart';
import '../register_screen/register_screen.dart';
import 'email_and_password_controller.dart';

class ForgotPasswordAndRegisterNow extends StatelessWidget {
  final AuthState state;
  const ForgotPasswordAndRegisterNow({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Spacings.paddingLogInButton,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            state.isLoading
                ? const CircularProgressIndicator()
                : ClipRRect(
                    borderRadius: Spacings.borderRadiusSignInButton,
                    child: SizedBox(
                      width: Spacings.widthMaterialButtonLogIn,
                      height: Spacings.heightMaterialButtonLogIn,
                      child: MaterialButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(AppEventLogIn(
                                email: emailController.text,
                                password: passwordController.text,
                              ));
                        },
                        color: CustomColors.primary,
                        child: Text(
                          AppLocalizations.of(context)!.loginNow,
                          style: const TextStyle(color: CustomColors.secondary),
                        ),
                      ),
                    ),
                  ),
            Padding(
              padding: Spacings.paddingForgotPassword,
              child: TextButton(
                  onPressed: () {
                    resetPasswordScreen(context);
                  },
                  child: Text(AppLocalizations.of(context)!.forgotPass)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.notMember),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                    },
                    child: Text(
                      AppLocalizations.of(context)!.registerNow,
                      style: const TextStyle(color: CustomColors.highlightText),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
