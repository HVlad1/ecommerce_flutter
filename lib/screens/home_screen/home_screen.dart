import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_flutter/api/product_details_api.dart';
import 'package:ecommerce_flutter/api/product_image_api.dart';
import 'package:ecommerce_flutter/models/product_details_model.dart';
import 'package:ecommerce_flutter/models/product_image_model.dart';
import 'package:flutter/material.dart';
import '../../components/widgets.dart';
import '../../models/models.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     CarouselSlider(
    //       options: CarouselOptions(
    //         aspectRatio: 1.5,
    //         enlargeCenterPage: true,
    //         viewportFraction: 0.9,
    //         enlargeStrategy: CenterPageEnlargeStrategy.height,
    //         enableInfiniteScroll: true,
    //         initialPage: 2,
    //         autoPlay: true,
    //       ),
    //       items: Category.categories
    //           .map((category) => CarouselCard(category: category))
    //           .toList(),
    //     ),
    //     SectionTitle(
    //       title: AppLocalizations.of(context)!.recommended,
    //     ),
    //     ProductCarousel(
    //         products: Product.products
    //             .where((product) => product.isRecommended)
    //             .toList()),
    //     SectionTitle(
    //       title: AppLocalizations.of(context)!.mostPopular,
    //     ),
    //     ProductCarousel(
    //         products: Product.products
    //             .where((product) => product.isPopular)
    //             .toList()),
    //   ],
    // );

    // return Center(
    //   child: FutureBuilder<ModelProductDetails>(
    //     future: ProductDetailsDataService.fetchData(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         print(snapshot.data!.productName);
    //         return Center(child: Text(snapshot.data!.productName.toString()));
    //       } else if (snapshot.hasError) {
    //         return Text('${snapshot.error}');
    //       }
    //       return const Center(child: CircularProgressIndicator());
    //     },
    //   ),
    // );

    return Center(
      child: FutureBuilder<List<ModelProductImg>>(
        future: ProductImageDataService.getImages(),
        builder: ((context, snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context,index) {
                print(snapshot.data![index].id);
                return Center(child: Text(snapshot.data![index].id));
              });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        })),
    );
  }
}
