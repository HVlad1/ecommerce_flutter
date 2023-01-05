import 'package:ecommerce_flutter/cubit/products_cubit.dart';
import 'package:ecommerce_flutter/screens/home_screen/recommended_carousel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ecommerce_flutter/components/widgets.dart';
import 'package:flutter/material.dart';

import 'most_popular_carousel.dart';
import 'slider_carousel.dart';

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
                  SliderCarousel(
                    productState: state,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SectionTitle(
                      title: AppLocalizations.of(context)!.recommended),
                  RecommendedCarousel(
                    productState: state,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SectionTitle(
                      title: AppLocalizations.of(context)!.mostPopular),
                  MostPopularCarousel(
                    productsState: state,
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
