import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Wishlist extends Equatable {
final List<ProductModel> products;
const Wishlist({this.products = const<ProductModel>[]});

  @override
  List<Object?> get props => [products];

}