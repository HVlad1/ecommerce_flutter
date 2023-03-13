// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../colors.dart';
import '../themes.dart';

class DividerRow extends StatelessWidget {
  const DividerRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          const Expanded(
              child: Divider(
            thickness: 0.5,
            color: CustomColors.primary,
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              AppLocalizations.of(context)!.continueWith,
              style: AppThemeData()
                  .appThemeData
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.grey[700]),
            ),
          ),
          const Expanded(
              child: Divider(
            thickness: 0.5,
            color: CustomColors.primary,
          )),
        ],
      ),
    );
  }
}
