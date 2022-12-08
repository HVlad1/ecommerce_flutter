import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
      ];
  static List<Product> products = [
    const Product(
        name: 'Laptop',
        category: 'Electronics',
        imageUrl:
            'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2071&q=80',
        price: 1299,
        isRecommended: true,
        isPopular: false),
    const Product(
      name: 'iPhone',
      category: 'Smartphone',
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1664197368374-605ce8ec8f54?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
      price: 999,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      name: 'Apple Watch',
      category: 'Smartwatch',
      imageUrl:
          'https://images.unsplash.com/photo-1617043786394-f977fa12eddf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
      price: 399,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      name: 'Apple Pencil',
      category: 'Smartwatch',
      imageUrl:
          'https://images.unsplash.com/photo-1502404768591-f24d06b7a366?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
      price: 250,
      isRecommended: true,
      isPopular: true,
    ),
  ];
}
