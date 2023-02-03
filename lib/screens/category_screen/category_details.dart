import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../colors.dart';
import '../../components/action_icon.dart';
import '../../components/product_card_big.dart';
import '../../cubit/products_cubit.dart';
import '../../spacing.dart';

class CategoryDetails extends StatefulWidget {
  final String title;
  final IconData icon;
  const CategoryDetails({super.key, required this.title, required this.icon});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondary,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            leading: Padding(
              padding: Spacings.paddingSliverAppBar,
              child: ActionIcon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  scrollController: _scrollController,
                  icon: Icons.arrow_back),
            ),
            backgroundColor: Colors.black,
            expandedHeight: Spacings.heightExpandedSliver,
            floating: false,
            shape: Spacings.shapeSliver,
            pinned: true,
            centerTitle: false,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.title),
              collapseMode: CollapseMode.parallax,
              background: Icon(
                widget.icon,
                color: Colors.white,
                size: Spacings.sizeIconBackground,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FutureBuilder(
                future: context.read<ProductsCubit>().getProducts(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Padding(
                      padding: Spacings.paddingCircularProgressIndicator,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (context.watch<ProductsCubit>().state
                        is ProductsLoaded) {
                      final ProductsLoaded state = context
                          .watch<ProductsCubit>()
                          .state as ProductsLoaded;
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: state.products.length > 15
                              ? 15
                              : state.products.length,
                          itemBuilder: (context, index) => ProductCardBig(
                              product: state.products.elementAt(index)));
                    }
                  }
                  return const SizedBox();
                })),
          ),
        ],
      ),
    );
  }
}
