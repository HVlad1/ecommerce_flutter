import 'package:ecommerce_flutter/colors.dart';
import 'package:ecommerce_flutter/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'email_and_password_controller.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: Spacings.paddingTextField,
        child: TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.primary)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.primary)),
            labelText: AppLocalizations.of(context)!.username,
          ),
        ));
  }
}
