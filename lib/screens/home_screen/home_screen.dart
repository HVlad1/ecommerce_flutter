import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../components/widgets.dart';
import '../../models/models.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enableInfiniteScroll: true,
              initialPage: 2,
              autoPlay: true,
            ),
            items: Category.categories
                .map((category) => CarouselCard(category: category))
                .toList(),
          ),
           SectionTitle(
            title: AppLocalizations.of(context)!.recommended,
          ),
          ProductCarousel(
              products: Product.products
                  .where((product) => product.isRecommended)
                  .toList()),
           SectionTitle(
            title: AppLocalizations.of(context)!.mostPopular,
          ),
          ProductCarousel(
              products: Product.products
                  .where((product) => product.isPopular)
                  .toList()),
        ],
      );
  }
}