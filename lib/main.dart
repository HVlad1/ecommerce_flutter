import 'package:ecommerce_flutter/router/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Go Router',
      theme: ThemeData(
        primaryColor: Colors.grey,
      ),
      routerConfig: router,
    );
  }
}