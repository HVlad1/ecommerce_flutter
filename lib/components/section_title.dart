import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/spacing.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Spacings.paddingSectionTitle,
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}