// ignore: depend_on_referenced_packages
// ignore_for_file: depend_on_referenced_packages, duplicate_ignore

import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/api/product_details_api.dart';
import 'package:ecommerce_flutter/api/product_image_api.dart';
import 'package:ecommerce_flutter/models/product_details_model.dart';
import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:meta/meta.dart';
import '../models/product_image_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductImageDataService productRepo;
  ProductDetailsDataService productDetailsRepo;
  ProductsCubit(this.productRepo, this.productDetailsRepo)
      : super(ProductsLoading());

  Future<void> getProducts() async {
    emit(ProductsLoading());

    List<ModelProductImg> productImage =
        await ProductImageDataService.getImages();
    List<ModelProductDetails> productsDetails =
        await ProductDetailsDataService.getDetails();
    List<ProductModel> products = [];
    for (int i = 0; i < productImage.length; i++) {
      ProductModel item =
          ProductModel(productsDetails[i], productImage[i].downloadUrl);
      products.add(item);
    }

    emit(ProductsLoaded(products: products));
  }
}
