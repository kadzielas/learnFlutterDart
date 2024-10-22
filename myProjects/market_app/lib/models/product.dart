import 'package:market_app/models/categories.dart';

class Product {
  const Product({
    required this.id,
    required this.title,
    required this.category,
  });
  final int id;
  final String title;
  final Categories category;
}
