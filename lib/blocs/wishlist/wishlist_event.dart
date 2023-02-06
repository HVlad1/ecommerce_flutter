part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent extends Equatable {}

class LoadWishlist extends WishlistEvent {
  @override
  List<Object> get props => [];
}

class AddProductToWishlist extends WishlistEvent {
  final ProductModel product;
   AddProductToWishlist(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProductFromWishlist extends WishlistEvent {
  final ProductModel product;
  RemoveProductFromWishlist(this.product);

  @override
  List<Object> get props => [product];
}
