import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../spacing.dart';
import '../../themes.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Spacings.paddingForgotPassword,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(AppLocalizations.of(context)!.forgotPass,
              style: AppThemeData()
                  .appThemeData
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Colors.grey[700])),
        ],
      ),
    );
  }
}