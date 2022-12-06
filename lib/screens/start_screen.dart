import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../components/carousel_card.dart';
import '../components/widgets.dart';
import '../models/models.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
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
          const SectionTitle(
            title: 'RECOMMENDED',
          ),
          // ProductCard(
          //   product: Product.products[0],
          // ),
          ProductCarousel(
              products: Product.products
                  .where((product) => product.isRecommended)
                  .toList()),
          const SectionTitle(
            title: 'MOST POPULAR',
          ),
          // ProductCard(
          //   product: Product.products[0],
          // ),
          ProductCarousel(
              products: Product.products
                  .where((product) => product.isPopular)
                  .toList()),
        ],
      );
  }
}