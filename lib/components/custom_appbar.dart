import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child:  Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.bold),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
