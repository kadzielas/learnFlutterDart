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
