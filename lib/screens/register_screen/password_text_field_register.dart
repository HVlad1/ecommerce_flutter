import 'package:ecommerce_flutter/blocs/wishlist/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../colors.dart';
import '../../spacing.dart';
import '../login_screen/email_and_password_controller.dart';

class PasswordTextFieldRegister extends StatefulWidget {
  const PasswordTextFieldRegister({
    super.key,
  });

  @override
  State<PasswordTextFieldRegister> createState() =>
      _PasswordTextFieldRegisterState();
}

class _PasswordTextFieldRegisterState extends State<PasswordTextFieldRegister> {
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
