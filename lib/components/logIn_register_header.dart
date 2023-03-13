// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../colors.dart';
import '../spacing.dart';
import '../themes.dart';

class Logo extends StatelessWidget {
  final String text;
  const Logo({
    Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         const SizedBox(
          height: Spacings.heightSizedBoxLogIn50,
        ),
        Center(
          child: Container(
            color: CustomColors.primary,
            padding: Spacings.paddingCustomAppBar,
            child: Text(
              AppLocalizations.of(context)!.appname,
              style: AppThemeData().appThemeData.appBarTheme.titleTextStyle,
            ),
          ),
        ),
        const SizedBox(
          height: Spacings.heightSizedBoxLogIn50,
        ),
        Text(text,
            style: AppThemeData()
                .appThemeData
                .textTheme
                .displaySmall
                ?.copyWith(color: Colors.grey[700])),
      ],
    );
  }
}