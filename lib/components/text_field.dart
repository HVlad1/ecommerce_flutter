// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:ecommerce_flutter/colors.dart';
import 'package:ecommerce_flutter/spacing.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  final String labelText;
  final bool obscureText;
  String? Function(String?)? validator;
   CustomTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.obscureText,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: Spacings.paddingTextField,
        child: TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.primary)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.primary)),
            labelText: labelText,
          ),
        ));
  }
} 
