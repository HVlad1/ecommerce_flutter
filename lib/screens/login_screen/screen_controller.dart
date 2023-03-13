import 'package:ecommerce_flutter/blocs/wishlist/auth/bloc/auth_bloc.dart';
import 'package:ecommerce_flutter/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repo/auth/auth.dart';

class ScreenController extends StatelessWidget {
  const ScreenController({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          return BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthStateLoggedIn || snapshot.hasData) {
                return const MainScreen();
              }
              if (state is AuthStateLoggedOut) {
                return const LoginScreen();
              } else {
                return const SizedBox();
              }
            },
          );
        });
  }
}
