import 'package:ecommerce_flutter/colors.dart';
import 'package:flutter/material.dart';

class SquareIcon extends StatelessWidget {
  final IconData icon;
  const SquareIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: CustomColors.secondary),
          borderRadius: BorderRadius.circular(16),
          color: Colors.black),
      child: Icon(
        icon,
        size: 35,
        color: Colors.white,
      ),
    );
  }
}
