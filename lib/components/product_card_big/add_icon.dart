import 'package:flutter/material.dart';

import '../../colors.dart';

class AddIcon extends StatelessWidget {
  const AddIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
          splashColor: Colors.transparent,
          onPressed: () {},
          icon: const Icon(
            Icons.add_circle,
            color: CustomColors.onPrimary,
          )),
    );
  }
}