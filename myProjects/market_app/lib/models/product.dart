import 'package:market_app/models/categories.dart';

class Product {
  const Product({
    required this.id,
    required this.title,
    required this.category,
    this.quantity,
    this.quanitityHome,
    this.isList,
  });
  final int id;
  final String title;
  final Categories category;
  final int? quantity;
  final int? quanitityHome;
  final bool? isList;
}
