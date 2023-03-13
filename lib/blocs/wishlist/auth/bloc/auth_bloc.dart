import 'package:ecommerce_flutter/repo/auth/auth_error.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repo/auth/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthStateLoggedOut(isLoading: false, successful: false)) {
    on<AppEventLogIn>((event, emit) async {
      emit(const AuthStateLoggedOut(isLoading: true, successful: false));
      try {
        await Auth().signInWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(const AuthStateLoggedIn(isLoading: false, successful: true));
      } on FirebaseAuthException catch (e) {
        authErrorLogin = e.toString();
        emit(const AuthStateLoggedOut(isLoading: false, successful: false));
      }
    });

    on<AppEventLogOut>((event, emit) async {
      emit(const AuthStateLoggedOut(isLoading: true, successful: false));

      await Auth().signOut();
      emit(const AuthStateLoggedOut(isLoading: false, successful: true));
    });

    on<AppEventRegister>((event, emit) async {
      emit(const AuthStateLoggedOut(isLoading: true, successful: false));
      try {
        await Auth().createUserWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(const AuthStateLoggedIn(isLoading: false, successful: true));
      } on FirebaseAuthException catch (e) {
        authErrorLogin = e.toString();
        emit(const AuthStateLoggedOut(isLoading: false, successful: false));
      }
    });

    on<AppEventResetPassword>((event, emit) async {
      emit(const AuthStateLoggedOut(isLoading: true, successful: false));
      try {
        await Auth().sendResetPasswordEmail(email: event.email);
         emit(const AuthStateLoggedOut(isLoading: false, successful: true));
      } on FirebaseAuthException catch (e) {
        authErrorLogin = e.toString();
        emit(const AuthStateLoggedOut(isLoading: false, successful: false));
      }
    });
  }
}
