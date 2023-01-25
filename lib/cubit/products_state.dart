part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductModel> products;

  ProductsLoaded({required this.products});
}

class ProductsError extends ProductsState {}
