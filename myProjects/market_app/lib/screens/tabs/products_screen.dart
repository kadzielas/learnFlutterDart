import 'package:flutter/material.dart';
import 'package:market_app/models/categories.dart';
import 'package:market_app/models/product.dart';

import 'package:market_app/providers/products_list.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String? selectedStore;
  Categories? selectedCategory;
  List<Product> filteredProduct = [];

  filteredProducts() async {
    filteredProduct = availableProductsList
        .where((productX) => productX.category == selectedCategory)
        .toList();

    print('filtered cyk cyk $filteredProduct');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DropdownButton<String>(
            hint: const Text('Wybierz kategorie'),
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
                connect();
                filteredProducts();

                if (newValue == 'Mrożone') {
                  selectedCategory = Categories.frozen;
                  print('mrozone cyk $selectedCategory');
                }
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: availableProductsList.length,
              itemBuilder: (ctx, index) => Dismissible(
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    // _removeItem(
                    //   _availableProductsList[index],
                    // );
                  } else if (direction == DismissDirection.startToEnd) {}
                },
                confirmDismiss: (DismissDirection direction) async {
                  if (direction == DismissDirection.endToStart) {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Potwierdzenie"),
                          content: const Text(
                              "Czy na pewno chcesz usunąć ten element?"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("Nie"),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("Tak"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  return null;
                },
                background: Container(
                  color: Colors.green,
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                ),
                key: ValueKey(filteredProduct[index].id),
                child: ListTile(
                  title: Text(filteredProduct[index].title),
                  leading: const SizedBox(
                    width: 8,
                    height: 8,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
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
          )
        ],
      ),
    );
  }
}
