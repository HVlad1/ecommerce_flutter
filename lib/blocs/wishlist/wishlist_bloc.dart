import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/wishlist_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<LoadWishlist>(_onLoadWishlist);
    on<AddProductToWishlist>(_onAddProductToWishlist);
    on<RemoveProductFromWishlist>(_onRemoveProductFromWishlist);
  }

  void _onLoadWishlist(event, Emitter<WishlistState> emit) async {
    emit(WishlistLoaded());
  }

  void _onAddProductToWishlist(event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        List<ProductModel> products = state.wishlist.products;
        products.add(event.product);
        emit(WishlistLoaded(wishlist: Wishlist(products: products)));
      } on Exception {
        emit(WishlistError());
      }
    }
  }

  void _onRemoveProductFromWishlist(event, Emitter<WishlistState> emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
            wishlist: Wishlist(
                products: List.from(state.wishlist.products)
                  ..remove(event.product))));
      } on Exception {
        emit(WishlistError());
      }
    }
  }
}
