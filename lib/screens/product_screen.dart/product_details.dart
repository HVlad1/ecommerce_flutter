import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:ecommerce_flutter/themes.dart';
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
            shape: const ContinuousRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
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
          buildDetails()
        ],
      ),
    );
  }

  Widget buildDetails() => SliverToBoxAdapter(
        child: Padding(
          padding: Spacings.paddingSliverToBoxAdapter,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    product.modelProductDetails.productName,
                    style: AppThemeData().appThemeData.textTheme.headline4,
                  ),
                  // Text(product.modelProductDetails.color,
                  //     style: const TextStyle(color: CustomColors.secondary))
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                width: double.infinity,
                height: Spacings.heightContainerDetails,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: Spacings.borderRadiusContainerDetails),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ExpansionTile(
                        title: const Text('Name'),
                        children: [
                          ListTile(
                            title:
                                Text(product.modelProductDetails.productName),
                          )
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('Price'),
                        children: [
                          ListTile(
                            title: Text(
                                '${product.modelProductDetails.priceString}\$'),
                          )
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('Material'),
                        children: [
                          ListTile(
                            title: Text(product.modelProductDetails.material),
                          )
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('Color'),
                        children: [
                          ListTile(
                            title: Text(product.modelProductDetails.color),
                          )
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('Promo Code'),
                        children: [
                          ListTile(
                            title: Text(product.modelProductDetails.promoCode),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
