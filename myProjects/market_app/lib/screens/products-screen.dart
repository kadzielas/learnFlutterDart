import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:market_app/models/categories.dart';
import 'package:market_app/models/product.dart';
import 'package:market_app/widgets/new_product.dart';
import 'package:postgres/postgres.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  // final void Function(Product product) onAddProduct;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String? selectedStore;
  String? selectedCategory;
  List<Product> _productsList = [];
  late dynamic conn;
  // var _isLoading = true;

  @override
  void initState() {
    super.initState();
    connectToDatabase();
    // _isLoading = false;
  }

  Future<void> connectToDatabase() async {
    final conn = await Connection.open(
      Endpoint(
        host: dotenv.env['DB_HOST']!,
        port: int.parse(dotenv.env['DB_PORT']!),
        database: dotenv.env['DB_NAME']!,
        username: dotenv.env['DB_USER']!,
        password: dotenv.env['DB_PASS']!,
      ),
      settings: const ConnectionSettings(sslMode: SslMode.disable),
    );

    print('has connection!');
    List<List<dynamic>> productsList =
        await conn.execute('SELECT id, title, category::text FROM products;');

    _productsList = productsList.map((row) {
      return Product(
        id: row[0],
        title: row[1] as String,
        category: _getCategoryFromString(row[2] as String),
      );
    }).toList();
    print(productsList);

    List<Product> filteredProducts = _productsList
        .where((item) => item.category == Categories.frozen)
        .toList();

    for (var product in filteredProducts) {
      print('${product.title} to mrożonka');
    }
  }

  Categories _getCategoryFromString(String categoryString) {
    return Categories.values.firstWhere(
      (e) => e.toString().split('.').last == categoryString,
      orElse: () => Categories.everything,
    );
  }

  @override
  void dispose() {
    conn.close();
    super.dispose();
  }

  void _removeItem(Product item) async {
    // final index = _productsList.indexOf(item);
    setState(() {
      _productsList.remove(item);
    });
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<Product>(
      MaterialPageRoute(
        builder: (ctx) => const NewProduct(),
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      _productsList.add(newItem);
    });
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
                if (newValue == 'Własne') {
                  print('Własne');
                } else if (newValue == 'Ulubione') {
                  selectedCategory = 'Ulubione';
                } else {
                  selectedCategory = newValue;
                }
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _productsList.length,
              itemBuilder: (ctx, index) => Dismissible(
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    // _removeItem(
                    //   _productsList[index],
                    // );
                    print('Dodałeś produkt');
                  } else if (direction == DismissDirection.startToEnd) {
                    print('Usunąłeś produkt');
                  }
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
                },
                background: Container(
                  color: Colors.green,
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                ),
                key: ValueKey(_productsList[index].id),
                child: ListTile(
                  title: Text(_productsList[index].title),
                  leading: Container(
                    width: 8,
                    height: 8,
                  ),
                ),
              ),
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
