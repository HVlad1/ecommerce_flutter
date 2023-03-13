import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:equatable/equatable.dart';


import '../../../models/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCartList>(_onLoadCartList);
    on<AddProductToCartList>(_onAddProductToCartList);
    on<RemoveProductFromCartList>(_onRemoveProductFromCartList);
  }

  void _onLoadCartList(event, Emitter<CartState> emit) {
    emit(CartLoaded());
  }

  void _onAddProductToCartList(event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)..add(event.product))));
      } on Exception {
        emit(CartError());
      }
    }
  }

  void _onRemoveProductFromCartList(event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)..remove(event.product))));
      } on Exception {
        emit(CartError());
      }
    }
  }
}
