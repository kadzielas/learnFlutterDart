//products_screen - page to add products into list to buy - this file is empty
//because code was moved into new_product.dart and is used as widget

import 'package:flutter/material.dart';
import 'package:market_app/widgets/new_product.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NewProduct(),
    );
  }
}
