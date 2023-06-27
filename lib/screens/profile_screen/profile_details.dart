import 'package:ecommerce_flutter/colors.dart';
import 'package:ecommerce_flutter/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../spacing.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.myProfile),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: Spacings.paddingProfileMenuContainer,
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: Spacings.borderProfileMenuContainer,
              color: CustomColors.backgroundContainerProfileMenu),
          padding: Spacings.paddingProfileMenuContainerContent,
          child: Column(
            children: [
              CustomerSincer(user: user),
              const SizedBox(height: Spacings.heightSizedBoxHeader),
              Email(user: user)
            ],
          ),
        ),
      ),
    );
  }
}

class CustomerSincer extends StatelessWidget {
  const CustomerSincer({
    super.key,
    required this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.customerSince,
              style: AppThemeData().appThemeData.textTheme.headlineSmall,
            ),
          ],
        ),
        const SizedBox(height: Spacings.heightSizedBox5),
        Row(
          children: [
            Text(
                '${user?.metadata.creationTime?.year}-${user?.metadata.creationTime?.month}-${user?.metadata.creationTime?.day}'),
          ],
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}

class Email extends StatelessWidget {
  const Email({
    super.key,
    required this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.checkoutEmail,
              style: AppThemeData().appThemeData.textTheme.headlineSmall,
            ),
          ],
        ),
        const SizedBox(height: Spacings.heightSizedBox5),
        Row(
          children: [
            Text('${user?.email}'),
          ],
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
