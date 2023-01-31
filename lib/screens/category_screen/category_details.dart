import 'package:ecommerce_flutter/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../colors.dart';
import '../../components/product_card_big.dart';
import '../../cubit/products_cubit.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({
    super.key,
  });

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondary,
      appBar: const CustomAppBar(
        title: 'Shoppy',
      ),
      body: FutureBuilder(
          future: context.read<ProductsCubit>().getProducts(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (context.watch<ProductsCubit>().state is ProductsLoaded) {
                final ProductsLoaded state =
                    context.watch<ProductsCubit>().state as ProductsLoaded;
                return ListView.builder(
                    itemCount:
                        state.products.length > 15 ? 15 : state.products.length,
                    itemBuilder: (context, index) => ProductCardBig(
                        product: state.products.elementAt(index)));
              }
            }
            return const SizedBox();
          })),
    );
  }
}
