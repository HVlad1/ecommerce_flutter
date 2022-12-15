import 'package:ecommerce_flutter/api/product_image_api.dart';
import 'package:ecommerce_flutter/screens/home_screen/most_popular_carousel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ecommerce_flutter/components/widgets.dart';
import 'package:ecommerce_flutter/models/product_image_model.dart';
import 'package:ecommerce_flutter/screens/home_screen/recommended_carousel.dart';
import 'package:flutter/material.dart';

import 'home_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ProductImageDataService.getImages(),
        builder: (BuildContext context,
            AsyncSnapshot<List<ModelProductImg>> imgModel) {
          if (imgModel.hasData) {
            return Column(
              children: [
                // imageCarousel(imgModel.data!),
                ImageCarousel(imgList: imgModel.data!),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 10,
                ),
                SectionTitle(
                  title: AppLocalizations.of(context)!.recommended,
                ),
                // recommendedProducts(imgModel.data!),
                RecommendedProducts(imgList: imgModel.data!),
                const SizedBox(
                  height: 10,
                ),
                SectionTitle(
                  title: AppLocalizations.of(context)!.mostPopular,
                ),
                // mostPopularProducts(imgModel.data!),
                MostPopularProducts(imgList: imgModel.data!),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
