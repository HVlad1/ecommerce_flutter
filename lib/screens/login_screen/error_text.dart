import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../repo/auth/auth_error.dart';
import '../../spacing.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: Spacings.paddingAuthErrorLogin,
        child: authErrorLogin != ''
            ? Text(
                textAlign: TextAlign.center,
                authErrorLogin.split(']')[1],
                style: const TextStyle(color: CustomColors.error),
              )
            : null);
  }
}