import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_app/widgets/main_drawer.dart';
import 'package:market_app/widgets/table.dart';
import 'package:market_app/providers/products_provider.dart';
import 'package:market_app/lists/products_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  void _setScreen(String identifier) {}

  @override
  Widget build(BuildContext context) {
    // final ProductsList product = ref.watch(productsProvider);
    Widget mainContent = const Center(
      child: Text('Lista jest pusta'),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ShoppingTable(),
              const SizedBox(height: 20),
              // Expanded(child: mainContent),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Zarządzaj listą'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
