import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../blocs/wishlist/cart/cart_bloc.dart';
import '../../colors.dart';

class AddIcon extends StatefulWidget {
  final ProductModel product;
  const AddIcon({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<AddIcon> createState() => _AddIconState();
}

class _AddIconState extends State<AddIcon> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return IconButton(
              splashColor: Colors.transparent,
              onPressed: () {
                final snackBar = SnackBar(content: Text(AppLocalizations.of(context)!.addedToCart));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                context.read<CartBloc>().add(
                      AddProductToCartList(widget.product),
                    );
              },
              icon: const Icon(
                Icons.add_circle,
                color: CustomColors.onPrimary,
              ));
        },
      ),
    );
  }
}
