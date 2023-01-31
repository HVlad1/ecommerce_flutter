import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  final int currentIndex;
  final int length;

  const SlideDots({Key? key, required this.currentIndex, required this.length})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) => buildDot(index, context)),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? Colors.red
            : Colors.red.withOpacity(0.5),
      ),
    );
  }
}
