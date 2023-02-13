import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:ecommerce_flutter/screens/product_screen.dart/product_details.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/radius.dart';
import '../../colors.dart';
import '../../spacing.dart';
import 'add_icon.dart';
import 'delete_icon.dart';
import 'name_price.dart';

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
              color: CustomColors.primary,
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
                          BigCardNameAndPrice(widget: widget),
                           AddIcon(product: widget.product,),
                          widget.isWishlist
                              ? DeleteIcon(widget: widget)
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
