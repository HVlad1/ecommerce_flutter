part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState extends Equatable {}

class WishlistLoading extends WishlistState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class WishlistLoaded extends WishlistState {
  final Wishlist wishlist;

  WishlistLoaded({this.wishlist = const Wishlist()});

  @override
  List<Object> get props => [wishlist];
}

class WishlistError extends WishlistState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
