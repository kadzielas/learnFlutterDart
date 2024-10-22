// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:market_app/models/categories.dart';
// import 'package:market_app/models/product.dart';
// import 'package:market_app/widgets/new_product.dart';
// import 'package:postgres/postgres.dart';

// class Postgres extends StatefulWidget {
//   const Postgres({super.key});

//   @override
//   State<Postgres> createState() => _PostgresState();
// }

// class _PostgresState extends State<Postgres> {
//   late dynamic conn;
//   List<Product> _productsList = [];
//   var _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     connectToDatabase();
//     _isLoading = false;
//   }

//   connectToDatabase() async {
//     final conn = await Connection.open(
//       Endpoint(
//         host: '192.168.0.211',
//         port: 5432,
//         database: 'bercikcart',
//         username: 'postgres',
//         password: '1234',
//       ),
//       settings: const ConnectionSettings(sslMode: SslMode.disable),
//     );

//     print('has connection!');
//     List<List<dynamic>> productsList =
//         await conn.execute('SELECT id, title, category::text FROM products;');

//     _productsList = productsList.map((row) {
//       return Product(
//         id: row[0],
//         title: row[1] as String,
//         category: _getCategoryFromString(row[2] as String),
//       );
//     }).toList();
//     print(productsList);
//   }

//   Categories _getCategoryFromString(String categoryString) {
//     return Categories.values.firstWhere(
//       (e) => e.toString().split('.').last == categoryString,
//       orElse: () => Categories.everything,
//     );
//   }

//   @override
//   void dispose() {
//     conn.close();
//     super.dispose();
//   }

//   void _removeItem(Product item) async {
//     // final index = _productsList.indexOf(item);
//     setState(() {
//       _productsList.remove(item);
//     });
//   }

//   void _addItem() async {
//     final newItem = await Navigator.of(context).push<Product>(
//       MaterialPageRoute(
//         builder: (ctx) => const NewProduct(),
//       ),
//     );

//     if (newItem == null) {
//       return;
//     }

//     setState(() {
//       _productsList.add(newItem);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget content = ListView.builder(
//       itemCount: _productsList.length,
//       itemBuilder: (ctx, index) => Dismissible(
//         onDismissed: (direction) {
//           if (direction == DismissDirection.endToStart) {
//             // _removeItem(
//             //   _productsList[index],
//             // );
//             print('Dodałeś produkt');
//           } else if (direction == DismissDirection.startToEnd) {
//             print('Usunąłeś produkt');
//           }
//         },
//         confirmDismiss: (DismissDirection direction) async {
//           if (direction == DismissDirection.endToStart) {
//             return await showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: const Text("Potwierdzenie"),
//                   content:
//                       const Text("Czy na pewno chcesz usunąć ten element?"),
//                   actions: <Widget>[
//                     TextButton(
//                       onPressed: () => Navigator.of(context).pop(false),
//                       child: const Text("Nie"),
//                     ),
//                     TextButton(
//                       onPressed: () => Navigator.of(context).pop(true),
//                       child: const Text("Tak"),
//                     ),
//                   ],
//                 );
//               },
//             );
//           }
//         },
//         background: Container(
//           color: Colors.green,
//         ),
//         secondaryBackground: Container(
//           color: Colors.red,
//         ),
//         key: ValueKey(_productsList[index].id),
//         child: ListTile(
//           title: Text(_productsList[index].title),
//           leading: Container(
//             width: 24,
//             height: 24,
//           ),
//         ),
//       ),
//     );

//     if (_isLoading) {
//       content = const Center(
//         child: CircularProgressIndicator(),
//       );
//     }

//     return Scaffold(
//       body: content,
//     );
//   }
// }
