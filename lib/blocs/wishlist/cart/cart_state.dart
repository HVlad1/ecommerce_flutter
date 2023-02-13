part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable{}

class CartLoading extends CartState {
   @override
  List<Object?> get props => throw UnimplementedError();
}

class CartLoaded extends CartState {
  final Cart cart;

  CartLoaded({this.cart = const Cart()});

  @override
  List<Object> get props => [cart];
}

class CartError extends CartState {
  @override
    List<Object?> get props => throw UnimplementedError();
}