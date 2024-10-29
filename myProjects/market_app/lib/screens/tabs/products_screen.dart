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
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    connect();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = false;
    });
  }

  String? selectedStore;
  late Categories selectedCategory;
  late List<Product> filteredProduct = [];

  filteredProducts(Categories category) {
    setState(() {
      if (category != Categories.everything) {
        filteredProduct = availableProductsList
            .where((productX) => productX.category == selectedCategory)
            .toList();
      } else {
        filteredProduct = availableProductsList;
      }

      print('filtered cyk cyk $filteredProduct i $selectedCategory');
    });
  }

  @override
  Widget build(BuildContext context) {
    late var titlehint = 'Wybierz kategorie';
    String? selectedValue;
    Widget loadingScreen = const Center(
      child: Placeholder(),
    );
    if (_isLoading) {
      loadingScreen = const Center(
        child: CircularProgressIndicator(),
      );
    }

    List<Product> showList() {
      if (filteredProduct.isEmpty) {
        return availableProductsList;
      } else {
        return filteredProduct;
      }
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DropdownButton<String>(
            hint: Text(titlehint),
            items: <String>[
              'Wszystko',
              'Ulubione',
              'Napoje',
              'Kawa i herbata',
              'Nabiał',
              'Warzywa i owoce',
              'Mięsa',
              'Mrożone',
              'Przekąski',
              'Przyprawy',
              'Sosy',
              'Środki czystości',
              'Różne',
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: (selectedValue == value) ? selectedValue : value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (categorytitle) {
              setState(() {
                switch (categorytitle) {
                  case 'Ulubione':
                    selectedCategory = Categories.favorites;

                    break;
                  case 'Napoje':
                    selectedCategory = Categories.softdrinks;

                    break;
                  case 'Kawa i herbata':
                    selectedCategory = Categories.coffetea;

                    break;
                  case 'Nabiał':
                    selectedCategory = Categories.dairy;

                    break;
                  case 'Warzywa i owoce':
                    selectedCategory = Categories.vegetablesfruits;

                    break;
                  case 'Mięsa':
                    selectedCategory = Categories.meats;

                    break;
                  case 'Mrożone':
                    selectedCategory = Categories.frozen;

                    break;
                  case 'Przekąski':
                    selectedCategory = Categories.snacks;

                    break;
                  case 'Przyprawy':
                    selectedCategory = Categories.spices;

                    break;
                  case 'Sosy':
                    selectedCategory = Categories.sauces;

                    break;
                  case 'Środki czystości':
                    selectedCategory = Categories.cleaning;

                    break;
                  case 'Różne':
                    selectedCategory = Categories.miscellaneous;

                    break;
                  default:
                    selectedCategory = Categories.everything;
                }

                setState(() {
                  titlehint = categorytitle!;
                });

                filteredProducts(selectedCategory);
              });
            },
          ),
          Expanded(
            child: _isLoading
                ? loadingScreen
                : ListView.builder(
                    itemCount: showList().length,
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
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: const Text("Nie"),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
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
                      key: ValueKey(showList()[index].id),
                      child: ListTile(
                        title: Text(showList()[index].title),
                        leading: const SizedBox(
                          width: 8,
                          height: 8,
                        ),
                      ),
                    ),
                  ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 0.5,
                  color: Color.fromARGB(255, 18, 100, 5),
                ),
              ),
            ),
            child: Row(
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
            ),
          )
        ],
      ),
    );
  }
}
