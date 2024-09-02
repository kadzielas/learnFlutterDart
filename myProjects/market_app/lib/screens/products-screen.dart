import 'package:flutter/material.dart';
import 'package:market_app/models/product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, required this.onAddProduct});

  final void Function(Product product) onAddProduct;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String? selectedStore;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DropdownButton<String>(
            hint: const Text('Wybierz sklep'),
            value: selectedStore,
            items: <String>[
              'Lidl',
              'Biedronka',
              'Żabka',
              'Aldi',
              'Carrefour',
              'Dino',
              'Kaufland',
              'Auchan'
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedStore = newValue;
              });
            },
          ),
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
  }
}
