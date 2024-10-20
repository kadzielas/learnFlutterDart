import 'package:flutter/material.dart';
import 'package:market_app/data/products_data.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  // final void Function(Product product) onAddProduct;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String? selectedStore;
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    // Logika filtrowania w build
    final filteredProductsByCategory = selectedCategory == 'Wszystko'
        ? testList
        : testList
            .where((product) =>
                product.category.toLowerCase() ==
                selectedCategory?.toLowerCase())
            .toList();

    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DropdownButton<String>(
            hint: const Text('Wybierz kategorie'),
            value: selectedCategory,
            items: <String>[
              'Własne',
              'Ulubione',
              'Nabiał',
              'Napoje',
              'Warzywa i owoce',
              'Różne',
              'Kawa i herbata',
              'Mrożone',
              'Środki czystości',
              'Przyprawy',
              'Mięsa',
              'Sosy',
              'Przekąski',
              'Wszystko'
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedCategory = newValue;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProductsByCategory.length,
              itemBuilder: (ctx, index) {
                final product = filteredProductsByCategory[index];
                return ListTile(
                  title: Text(product.title),
                );
              },
            ),
          ),
          TextButton(
            onPressed: () {
              print('Produkty zostały dodane do koszyka');
              Navigator.pop(context);
            },
            child: const Text('Dodaj produkty'),
          ),
          TextButton(
            onPressed: () {
              print('Wybrane produkty zostały anulowane');
              Navigator.pop(context);
            },
            child: const Text('Anuluj'),
          ),
        ],
      ),
    );
  }
}
