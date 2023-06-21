import 'package:ecommerce_flutter/screens/profile_screen/expansion_tile_help.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../spacing.dart';

void help(BuildContext context) {
  showModalBottomSheet(
      context: context,
      shape:
          RoundedRectangleBorder(borderRadius: Spacings.borderRadiusModalHelp),
      builder: (context) => SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: Spacings.paddingTopContainerResetPassword,
                    child: ClipRect(
                      child: Container(
                        height: Spacings.heightTopContainerResetPassword,
                        width: Spacings.widthTopContainerResetPassword,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: Spacings.paddingContentModal,
                    child: Column(
                      children: [
                        ExpansionTileHelp(
                          title: AppLocalizations.of(context)!.text1Help,
                          content:
                              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                        ),
                        ExpansionTileHelp(
                            title: AppLocalizations.of(context)!.text2Help,
                            content:
                                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
                        ExpansionTileHelp(
                            title: AppLocalizations.of(context)!.text3Help,
                            content:
                                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
}
