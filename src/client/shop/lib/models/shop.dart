import 'package:shop/models/product.dart';

class Shop {
  final String id;
  final String name;
  final String location;
  final String imageUrl;
  final List<Product> products;

  Shop({
    required this.id,
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.products,
  });
}
