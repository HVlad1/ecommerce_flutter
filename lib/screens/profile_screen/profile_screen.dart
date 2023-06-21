import 'package:ecommerce_flutter/blocs/wishlist/auth/bloc/auth_bloc.dart';
import 'package:ecommerce_flutter/colors.dart';
import 'package:ecommerce_flutter/screens/profile_screen/profile_menu.dart';
import 'package:ecommerce_flutter/screens/profile_screen/profile_menu_help.dart';
import 'package:ecommerce_flutter/screens/profile_screen/profile_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../spacing.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: Column(
        children: [
          const SizedBox(height: Spacings.heightSizedBoxHeader),
          ProfileMenu(
            title: AppLocalizations.of(context)!.myProfile,
            icon: Icons.person,
            press: () {},
          ),
          ProfileMenu(
            title: AppLocalizations.of(context)!.myOrders,
            icon: Icons.list_rounded,
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileOrderScreen()));
            },
          ),
          ProfileMenu(
            title: AppLocalizations.of(context)!.shoppyHelp,
            icon: Icons.headset_mic,
            press: () {
              help(context);
            },
          ),
          ProfileMenu(
            title: AppLocalizations.of(context)!.logOut,
            icon: Icons.logout,
            press: () => context.read<AuthBloc>().add(const AppEventLogOut()),
          ),
        ],
      ),
    );
  }
}
