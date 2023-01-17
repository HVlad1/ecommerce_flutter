import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:ecommerce_flutter/screens/product_screen.dart/product_details_body.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../spacing.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;
  const ProductDetails({super.key, required this.product});

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
        slivers: [
          SliverAppBar(
            shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            leading: Padding(
              padding: Spacings.paddingSliverAppBar,
              child: Container(
                  decoration: const BoxDecoration(
                    color: CustomColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      splashColor: Colors.transparent,
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back))),
            ),
            actions: [
              Padding(
                padding: Spacings.paddingSliverAppBar,
                child: Container(
                    decoration: const BoxDecoration(
                      color: CustomColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.favorite))),
              ),
            ],
            backgroundColor: Colors.transparent,
            expandedHeight: Spacings.heightSliverAppBar,
            floating: false,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Image.network(
                product.downloadUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ProductDetailsBody(product: product),
        ],
      ),
    );
  }
}
