import 'package:ecommerce_flutter/blocs/wishlist/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../colors.dart';
import '../../spacing.dart';
import 'email_and_password_controller.dart';

class PasswordTextFieldLogin extends StatefulWidget {
  const PasswordTextFieldLogin({
    super.key,
  });

  @override
  State<PasswordTextFieldLogin> createState() => _PasswordTextFieldLoginState();
}

class _PasswordTextFieldLoginState extends State<PasswordTextFieldLogin> {
  bool _visiblePassword = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Spacings.paddingTextField,
      child: TextField(
        onSubmitted: (value) {
          context.read<AuthBloc>().add(AppEventLogIn(
              email: emailController.text, password: passwordController.text));
        },
        controller: passwordController,
        obscureText: _visiblePassword,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _visiblePassword = !_visiblePassword;
                });
              },
              icon: Icon(
                  _visiblePassword ? Icons.visibility : Icons.visibility_off)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.primary)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.primary)),
          labelText: AppLocalizations.of(context)!.password,
        ),
      ),
    );
  }
}
