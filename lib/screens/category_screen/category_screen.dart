import 'package:ecommerce_flutter/cubit/products_cubit.dart';
import 'package:ecommerce_flutter/screens/category_screen/category_card.dart';
import 'package:ecommerce_flutter/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<ProductsCubit, ProductsState>(builder: (_, state) {
            if (state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductsError) {
              return Center(child: Text(AppLocalizations.of(context)!.error));
            } else {
              return Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: Spacings.heightSizedBoxCategoryScreen,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CategoryCard(
                              title: AppLocalizations.of(context)!.offers,
                              icon: Icons.watch_later),
                          CategoryCard(
                              title: AppLocalizations.of(context)!.sports,
                              icon: Icons.sports_esports)
                        ],
                      ),
                      const SizedBox(
                        height: Spacings.heightSizedBoxCategoryScreen,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CategoryCard(
                              title: AppLocalizations.of(context)!.it,
                              icon: Icons.laptop),
                          CategoryCard(
                              title: AppLocalizations.of(context)!.electronics,
                              icon: Icons.electrical_services)
                        ],
                      ),
                      const SizedBox(
                        height: Spacings.heightSizedBoxCategoryScreen,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CategoryCard(
                              title: AppLocalizations.of(context)!.homeGardening,
                              icon: Icons.house_sharp),
                          CategoryCard(
                              title: AppLocalizations.of(context)!.clothes,
                              icon: Icons.supervisor_account)
                        ],
                      ),
                      const SizedBox(
                        height: Spacings.heightSizedBoxCategoryScreen,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CategoryCard(
                              title: AppLocalizations.of(context)!.kids,
                              icon: Icons.toys_rounded),
                          CategoryCard(
                              title: AppLocalizations.of(context)!.music,
                              icon: Icons.music_note)
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          })
        ],
      ),
    );
  }
}
