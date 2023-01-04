import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_flutter/cubit/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ecommerce_flutter/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/radius.dart';

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
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (_, state) {
            if (state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductsError) {
              return Center(child: Text(AppLocalizations.of(context)!.error));
            } else {
              return Column(
                children: [
                  CarouselSlider(
                    items: (state as ProductsLoaded)
                        .products
                        .map((model) {
                          return CarouselCard(product: model);
                        })
                        .toList()
                        .sublist(0, 10),
                    options: CarouselOptions(
                      aspectRatio: 1.6,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      enableInfiniteScroll: true,
                      initialPage: 2,
                      autoPlay: true,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SectionTitle(
                      title: AppLocalizations.of(context)!.recommended),
                  CarouselSlider(
                    items: (state)
                        .products
                        .map((model) {
                          return Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: Radius.radiusContaierProducts,
                              ),
                              child: ProductCard(product: model));
                        })
                        .toList()
                        .sublist(10, 13),
                    options: CarouselOptions(
                      aspectRatio: 2.5,
                      enlargeCenterPage: true,
                      viewportFraction: 0.4,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      enableInfiniteScroll: false,
                      initialPage: 1,
                      autoPlay: false,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SectionTitle(
                      title: AppLocalizations.of(context)!.mostPopular),
                  CarouselSlider(
                    items: (state)
                        .products
                        .map((model) {
                          return Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: Radius.radiusContaierProducts,
                              ),
                              child: ProductCard(product: model));
                        })
                        .toList()
                        .sublist(14, 19),
                    options: CarouselOptions(
                      aspectRatio: 2.5,
                      enlargeCenterPage: true,
                      viewportFraction: 0.4,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      enableInfiniteScroll: false,
                      initialPage: 1,
                      autoPlay: false,
                    ),
                  )
                ],
              );
            }
          },
        )
      ],
    );
  }
}
