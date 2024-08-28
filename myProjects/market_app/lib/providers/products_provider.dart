import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_app/data/products_data.dart';

final productsProvider = Provider(
  (ref) {
    return availableProducts;
  },
);
