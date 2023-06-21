import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../spacing.dart';

class ExpansionTileHelp extends StatelessWidget {
  const ExpansionTileHelp({
    super.key, required this.title, required this.content,
  });
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title:
             Text(title),
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: Spacings.borderRadiusExpansionTileHelp,
                color: CustomColors
                    .backgroundContainerProfileMenu),
            child: Padding(
              padding:  Spacings.paddingExpansionTileHelp,
              child: ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      content,
                      style: const TextStyle(
                          color: CustomColors.primary),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]);
  }
}