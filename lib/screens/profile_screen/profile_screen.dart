import 'package:ecommerce_flutter/repo/firestore_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirestoreDataService().signOut();
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
      body: Center(
        child: Text("Logged in:${user.email!}"),
      ),
    );
  }
}
