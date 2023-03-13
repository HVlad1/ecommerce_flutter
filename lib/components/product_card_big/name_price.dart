import 'package:ecommerce_flutter/components/product_card_big/product_card_big.dart';
import 'package:flutter/cupertino.dart';

import '../../spacing.dart';
import '../../themes.dart';

class BigCardNameAndPrice extends StatelessWidget {
  const BigCardNameAndPrice({
    Key? key,
    required this.widget,
    
  }) : super(key: key);

  final ProductCardBig widget;
 

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                  .bodyLarge,
            ),
            Text(
              '${widget.product.modelProductDetails.priceString}\$',
              style: AppThemeData()
                  .appThemeData
                  .textTheme
                  .bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}