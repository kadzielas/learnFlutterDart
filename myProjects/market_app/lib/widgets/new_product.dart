import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:market_app/main.dart';
import 'package:market_app/models/categories.dart';
import 'package:market_app/models/list_shop.dart';
import 'package:market_app/models/product.dart';

import 'package:market_app/providers/database_connection.dart';

final List<String> _categoryList = <String>[
  'Wszystko',
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
];

class NewProduct extends StatefulWidget {
  const NewProduct({super.key});

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  late Categories selectedCategory;
  late List<Product> filteredProduct = [];
  String? selectedCategoryTitle = _categoryList.first;
  ListShop? _selectedList;
  String _selectedListString = 'Wybierz liste';
  // final TextEditingController _controller = TextEditingController();
  // final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    connect();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      isLoading = false;
    });
  }

  _filteredProducts(Categories category) {
    setState(() {
      if (category != Categories.everything) {
        filteredProduct = availableProductsList
            .where((productX) => productX.category == selectedCategory)
            .toList();
      } else {
        filteredProduct = availableProductsList;
      }
    });
  }

  List<Product> _showList() {
    if (filteredProduct.isEmpty) {
      return availableProductsList;
    } else {
      return filteredProduct;
    }
  }

  int _incrementQuantity(int id) {
    setState(() {
      availableProductsList[id].quanitityHome =
          (availableProductsList[id].quanitityHome ?? 0) + 1;
    });
    return availableProductsList[id].quanitityHome!;
  }

  void _decrementQuantity(int id) {
    setState(() {
      var item =
          availableProductsList.firstWhere((element) => element.id == id);
      item.quanitityHome = (item.quanitityHome ?? 0) - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double widthMobile = MediaQuery.of(context).size.width;
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    Widget loadingScreen = const Center(
      child: Placeholder(),
    );
    if (isLoading) {
      loadingScreen = const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton<String>(
                elevation: 16,
                value: selectedCategoryTitle,
                hint: SizedBox(
                  width: widthMobile * 0.3,
                  child: Text(
                    selectedCategoryTitle!,
                    style: TextStyle(color: primaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                underline: Container(
                  height: 2,
                  color: primaryColor,
                ),
                onChanged: (String? value) {
                  setState(() {
                    switch (value) {
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
                    selectedCategoryTitle = value!;
                    _filteredProducts(selectedCategory);
                  });
                },
                items:
                    _categoryList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: SizedBox(
                      width: 150,
                      child: Text(
                        value,
                        style: TextStyle(color: primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }).toList(),
              ),
              DropdownButton<ListShop>(
                elevation: 16,
                value: _selectedList,
                hint: SizedBox(
                  width: widthMobile * 0.4,
                  child: Text(
                    _selectedListString,
                    style: TextStyle(color: primaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                onChanged: (ListShop? value) {
                  setState(() {
                    _selectedListString = value!.title.toString();
                  });
                },
                items: lists.map((ListShop value) {
                  return DropdownMenuItem<ListShop>(
                    value: value,
                    child: Text(value.title),
                  );
                }).toList(),
              ),
            ],
          ),
          Expanded(
            child: isLoading
                ? loadingScreen
                : ListView.builder(
                    itemCount: _showList().length,
                    itemBuilder: (ctx, index) => Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: widthMobile * 0.1,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (_showList()[index].isFav == false) {
                                    _showList()[index].isFav = true;
                                  } else {
                                    _showList()[index].isFav = false;
                                  }
                                });
                              },
                              icon: _showList()[index].isFav!
                                  ? const Icon(Icons.star_outlined)
                                  : const Icon(Icons.star_border),
                              // key: ValueKey(isFav),
                            ),
                          ),
                          SizedBox(
                            width: widthMobile * 0.5,
                            child: Text(
                              _showList()[index].title,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            width: widthMobile * 0.25,
                            child: Row(
                              children: [
                                InputQty(
                                  maxVal: 100,
                                  initVal: 0,
                                  steps: 1,
                                  minVal: 0,
                                  qtyFormProps:
                                      const QtyFormProps(enableTyping: false),
                                  decoration: QtyDecorationProps(
                                      isBordered: false,
                                      plusBtn: Icon(
                                        Icons.add,
                                        color: primaryColor,
                                      ),
                                      minusBtn: Icon(
                                        Icons.remove,
                                        color: primaryColor,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ],
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
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Produkty zostały dodane do listy: ${_selectedListString}'),
                      ),
                    );
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
