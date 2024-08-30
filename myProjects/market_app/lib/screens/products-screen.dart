import 'package:flutter/material.dart';
import 'package:market_app/data/products_data.dart';
import 'package:market_app/models/product.dart';
import 'package:market_app/widgets/products_grid_item.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.onAddProduct});

  final void Function(Product product) onAddProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const Spacer(),
          TextButton(
            onPressed: () {
              print('produkty zostały dodane do koszyka');
              Navigator.pop(context);
            },
            child: const Text('Dodaj produkty'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Anuluj'),
          ),
        ],
      ),
    );
    // GridView(
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //       childAspectRatio: 3 / 2,
    //       crossAxisSpacing: 20,
    //       mainAxisSpacing: 20),
    //   children: [
    //     for (final products in availableProducts)
    //       ProductsGridItem(
    //         product: products,
    //         onSelectProduct: () {},
    //       ),
    //   ],
    // );
  }
}
