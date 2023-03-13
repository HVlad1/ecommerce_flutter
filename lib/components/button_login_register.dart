import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/wishlist/auth/bloc/auth_bloc.dart';
import '../colors.dart';
import '../screens/login_screen/email_and_password_controller.dart';

class ButtonRegister extends StatelessWidget {
  final AuthState state;
  final String name;
  const ButtonRegister(
      {super.key, required this.state, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.center,
        child: state.isLoading
            ? const CircularProgressIndicator()
            : ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: MaterialButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AppEventRegister(
                          email: emailController.text,
                          password: passwordController.text));
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    color: CustomColors.primary,
                    child: Text(
                      name,
                      style: const TextStyle(color: CustomColors.secondary),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}