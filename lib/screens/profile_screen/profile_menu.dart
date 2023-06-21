import 'package:ecommerce_flutter/themes.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../spacing.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key, required this.title, required this.icon, required this.press,
  });

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Spacings.paddingProfileMenuContainer,
      child: GestureDetector(
        onTap: press,
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: Spacings.borderProfileMenuContainer,
              color: CustomColors.backgroundContainerProfileMenu),
          padding: Spacings.paddingProfileMenuContainerContent,
          child: Row(
            children:  [
              Icon(
                icon ,
                color: CustomColors.textColorOnWhite,
              ),
              const SizedBox(
                width: Spacings.heightSizedBoxHeader,
              ),
              Expanded(
                  child: Text(
                title,
                style: AppThemeData().appThemeData.textTheme.headlineSmall,
              )),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  } }