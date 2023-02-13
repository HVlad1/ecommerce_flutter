import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<ProductModel> products;
  const Cart({this.products = const <ProductModel>[]});

  double get subtotal =>
      products.fold(0, (total, current) => total + current.modelProductDetails.price);

  double deliveryFee(subtotal) {
    if (subtotal >= 30.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 30.0) {
      return "You have Free Delivery";
    } else {
      double missing = 30.0 - subtotal;
      return "Add \$${missing.toStringAsFixed(2)} for FREE Delivery";
    }
  }

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal);
  @override
  List<Object?> get props => [products];
}
