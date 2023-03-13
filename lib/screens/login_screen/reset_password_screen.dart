import 'package:ecommerce_flutter/blocs/wishlist/auth/bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../colors.dart';
import '../../spacing.dart';
import 'email_and_password_controller.dart';

void resetPasswordScreen(BuildContext context) {
  showModalBottomSheet(
      context: context,
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
                    padding: Spacings.generalPaddingResetPassword,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.resetPassword,
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            AppLocalizations.of(context)!.insertEmail,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CustomColors.greyText),
                          ),
                          Padding(
                              padding:
                                  Spacings.paddingTextFormFieldResetPassword,
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: CustomColors.primary)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: CustomColors.primary)),
                                  labelText:
                                      AppLocalizations.of(context)!.username,
                                ),
                              )),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              height: Spacings.heightMaterialButtonLogIn,
                              width: Spacings.widthMaterialButtonLogIn,
                              child: BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                                  return MaterialButton(
                                    color: CustomColors.primary,
                                    onPressed: () {
                                      context.read<AuthBloc>().add(
                                          AppEventResetPassword(
                                              email: emailController.text));
                                      Navigator.pop(context);
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              CupertinoAlertDialog(
                                                title: Text(AppLocalizations.of(
                                                        context)!
                                                    .emailSended),
                                                content: Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .emailConfirmation),
                                                actions: [
                                                  CupertinoDialogAction(
                                                    child: Text(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .ok),
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                  )
                                                ],
                                              ));
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!.sendText,
                                      style: const TextStyle(
                                          color: CustomColors.secondary),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
}
