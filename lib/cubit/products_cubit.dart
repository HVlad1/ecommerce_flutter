// ignore: depend_on_referenced_packages
// ignore_for_file: depend_on_referenced_packages, duplicate_ignore

import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/api/product_image_api.dart';
import 'package:meta/meta.dart';
import '../models/product_image_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductImageDataService productRepo;
  ProductsCubit(this.productRepo) : super(ProductsLoading());

  Future<void> getProducts() async {
    emit(ProductsLoading());

    List<ModelProductImg> products = await ProductImageDataService.getImages();

    emit(ProductsLoaded(products: products));
  }
}
