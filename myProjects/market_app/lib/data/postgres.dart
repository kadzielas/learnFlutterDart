import 'package:flutter/material.dart';
import 'package:market_app/models/product.dart';
import 'package:postgres/postgres.dart';

class Postgres extends StatefulWidget {
  const Postgres({super.key});

  @override
  State<Postgres> createState() => _PostgresState();
}

class _PostgresState extends State<Postgres> {
  late dynamic conn;
  final List<Product> products = [];

  @override
  void initState() {
    super.initState();
    _connectToDatabase();
  }

  Future<void> _connectToDatabase() async {
    conn = await Connection.open(
      Endpoint(
        host: '192.168.0.211',
        port: 5432,
        database: 'bercikcart',
        username: 'postgres',
        password: '1234',
      ),
    );
    await conn.open();
    await _fetchProducts();
    print('connected');
  }

  Future<void> _fetchProducts() async {
    List<Product> result = await conn.query("SELECT * FROM products;");
    print('SQL QUERY DONE');
    setState(() {
      print(result);
    });
  }

  @override
  void dispose() {
    conn.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: products.isEmpty
          ? const Center(
              child: Text('Lista jest pusta'),
            )
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Text('data');
              },
            ),
    );
  }
}
