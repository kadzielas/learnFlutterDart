import 'package:market_app/models/categories.dart';

class Product {
  Product({
    required this.id,
    required this.title,
    required this.category,
    this.quantity,
    this.quanitityHome,
    this.isList,
    this.isFav,
  });
  final int id;
  final String title;
  final Categories category;
  int? quantity;
  int? quanitityHome;
  bool? isList;
  bool? isFav;
}
