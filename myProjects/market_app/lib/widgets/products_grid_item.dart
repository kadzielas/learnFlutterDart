import 'package:flutter/material.dart';
import 'package:market_app/models/product.dart';

class ProductsGridItem extends StatelessWidget {
  const ProductsGridItem(
      {super.key, required this.product, required this.onSelectProduct});

  final Product product;
  final void Function() onSelectProduct;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectProduct,
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
