import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreDataService {
  Future getDocId(List<String> orderId) async {
    await FirebaseFirestore.instance
        .collection('checkout')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              orderId.add(element.reference.id);
            }));
  }

  void signUserIn(
    TextEditingController emailController,
    TextEditingController passwordController,
    BuildContext context,
  ) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongMessageAlert(context, 'Wrong email');
      } else if (e.code == 'wrong-password') {
        wrongMessageAlert(context, 'Wrong password');
      }
    }
  }

  void wrongMessageAlert(BuildContext context, String text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              text,
              style: const TextStyle(color: CustomColors.primary),
            ),
          );
        });
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  void createUser(
      TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController confirmPasswordController,
      BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        wrongMessageAlert(context, "Password don't match!");
      }
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      wrongMessageAlert(context, e.code);
    }
  }
}
