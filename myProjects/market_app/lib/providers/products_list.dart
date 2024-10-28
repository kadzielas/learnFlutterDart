import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:market_app/models/categories.dart';
import 'package:market_app/models/product.dart';
import 'package:postgres/postgres.dart';

List<Product> availableProductsList = [];
List<Product> listProducts = [];
late dynamic conn;

Future<void> connect() async {
  await dotenv.load(fileName: ".env");
  connectToDatabase();
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
  List<List<dynamic>> downloadedlist = await conn.execute(
      'SELECT id, title, category::text, quantity, quantityhome FROM products;');
  availableProductsList = downloadedlist.map((row) {
    return Product(
      id: row[0],
      title: row[1] as String,
      category: _getCategoryFromString(row[2] as String),
      quantity: row[3],
      quanitityHome: row[4],
    );
  }).toList();
  print(availableProductsList);
}

Categories _getCategoryFromString(String categoryString) {
  return Categories.values.firstWhere(
    (e) => e.toString().split('.').last == categoryString,
    orElse: () => Categories.everything,
  );
}
