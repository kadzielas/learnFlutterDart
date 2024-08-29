import 'package:flutter/material.dart';
import 'package:market_app/data/products_data.dart';
import 'package:market_app/widgets/products_grid_item.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final products in availableProducts)
          ProductsGridItem(
            product: products,
            onSelectProduct: () {},
          ),
      ],
    );
  }
}
