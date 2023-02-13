import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:ecommerce_flutter/screens/product_screen.dart/product_details.dart';
import 'package:flutter/material.dart';

import '../../themes.dart';

class CartProductCard extends StatefulWidget {
  final ProductModel product;
  const CartProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails(product: widget.product))),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: [
            Image.network(
              widget.product.downloadUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.modelProductDetails.productName,
                    style: AppThemeData().appThemeData.textTheme.headline5,
                  ),
                  Text(
                    '${widget.product.modelProductDetails.priceString}\$',
                    style: AppThemeData().appThemeData.textTheme.bodyText2,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.remove_circle)),
                const Text('1'),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
