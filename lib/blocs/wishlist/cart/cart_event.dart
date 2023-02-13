part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {}

class LoadCartList extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddProductToCartList extends CartEvent {
  final ProductModel product;
  AddProductToCartList(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProductFromCartList extends CartEvent {
  final ProductModel product;
  RemoveProductFromCartList(this.product);

  @override
  List<Object> get props => [product];
}
