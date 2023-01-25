import 'package:ecommerce_flutter/colors.dart';
import 'package:ecommerce_flutter/spacing.dart';
import 'package:ecommerce_flutter/themes.dart';
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
      backgroundColor: CustomColors.transparent,
      elevation: 0,
      title: Container(
        color: CustomColors.primary,
        padding: Spacings.paddingCustomAppBar,
        child: Text(
          title,
          style: AppThemeData().appThemeData.appBarTheme.titleTextStyle,
        ),
      ),
      iconTheme: const IconThemeData(color: CustomColors.primary),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
