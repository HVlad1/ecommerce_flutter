import 'package:ecommerce_flutter/components/product_card_big/product_card_big.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../blocs/wishlist/wishlist_bloc.dart';
import '../../colors.dart';

class DeleteIcon extends StatelessWidget {
  const DeleteIcon({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProductCardBig widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          return IconButton(
              splashColor: Colors.transparent,
              onPressed: () {
                final snackBar = SnackBar(
                    content: Text(AppLocalizations.of(context)!.deleted));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                context
                    .read<WishlistBloc>()
                    .add(RemoveProductFromWishlist(widget.product));
              },
              icon: const Icon(
                Icons.delete,
                color: CustomColors.onPrimary,
              ));
        },
      ),
    );
  }
}
