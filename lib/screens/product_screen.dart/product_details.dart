import 'package:ecommerce_flutter/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_flutter/components/action_icon.dart';
import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:ecommerce_flutter/screens/product_screen.dart/product_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../colors.dart';
import '../../spacing.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primary,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: CustomColors.secondary,
        child: const Icon(
          Icons.shopping_cart,
          color: CustomColors.primary,
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            leading: Padding(
              padding: Spacings.paddingSliverAppBar,
              child: ActionIcon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  scrollController: _scrollController,
                  icon: Icons.arrow_back),
            ),
            actions: [
              Padding(
                padding: Spacings.paddingSliverAppBar,
                child: BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                    return ActionIcon(
                      onPressed: () {
                      final snackBar = SnackBar(content: Text(AppLocalizations.of(context)!.added));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        context.read<WishlistBloc>().add(AddProductToWishlist(widget.product),);
                      },
                      icon: Icons.favorite,
                      scrollController: _scrollController,
                    );
                  },
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
            expandedHeight: Spacings.heightSliverAppBar,
            floating: false,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Image.network(
                widget.product.downloadUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ProductDetailsBody(product: widget.product),
        ],
      ),
    );
  }
}
