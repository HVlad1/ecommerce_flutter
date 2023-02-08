import 'package:ecommerce_flutter/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:ecommerce_flutter/screens/product_screen.dart/product_details.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/radius.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../colors.dart';
import '../spacing.dart';
import '../themes.dart';

class ProductCardBig extends StatefulWidget {
  final ProductModel product;
  final bool isWishlist;

  const ProductCardBig({
    Key? key,
    required this.product,
    this.isWishlist = false,
  }) : super(key: key);

  @override
  State<ProductCardBig> createState() => _ProductCardBigState();
}

class _ProductCardBigState extends State<ProductCardBig> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetails(product: widget.product))),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 33.0,
              offset: Offset(
                20.0,
                20.0,
              ),
            )
          ],
        ),
        child: Padding(
          padding: Spacings.paddingProductCardBig,
          child: ClipRRect(
            borderRadius: Radius.radiusProductCard,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: Spacings.heightProductCard,
                  child: Image.network(widget.product.downloadUrl,
                      fit: BoxFit.cover, width: Spacings.widthProductCardImage),
                ),
                Positioned(
                  top: Spacings.alignBlackLineTop,
                  right: 0,
                  child: Container(
                    width: screenWidth * 0.97,
                    height: Spacings.heightBlackLineThroughProductCard,
                    decoration: BoxDecoration(
                      color: CustomColors.primary.withOpacity(0.4),
                    ),
                    child: Padding(
                      padding: Spacings.paddingBlackLineContent,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding: Spacings.paddingProductCardBig,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.product.modelProductDetails
                                        .productName,
                                    style: AppThemeData()
                                        .appThemeData
                                        .textTheme
                                        .bodyText1,
                                  ),
                                  Text(
                                    '${widget.product.modelProductDetails.priceString}\$',
                                    style: AppThemeData()
                                        .appThemeData
                                        .textTheme
                                        .bodyText1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                                splashColor: Colors.transparent,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: CustomColors.onPrimary,
                                )),
                          ),
                          widget.isWishlist
                              ? Expanded(
                                  child:
                                      BlocBuilder<WishlistBloc, WishlistState>(
                                    builder: (context, state) {
                                      return IconButton(
                                          splashColor: Colors.transparent,
                                          onPressed: () {
                                            final snackBar = SnackBar(
                                                content: Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .deleted));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                            context.read<WishlistBloc>().add(
                                                RemoveProductFromWishlist(
                                                    widget.product));
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: CustomColors.onPrimary,
                                          ));
                                    },
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
