import 'package:flutter/material.dart';
import 'package:market_app/data/products_data.dart';
import 'package:market_app/models/product.dart';

import 'package:market_app/screens/home-screen.dart';
import 'package:market_app/screens/products-screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({
    super.key,
  });

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
    if (index == 0) {
      print('Zarządzaj listą');
    } else if (index == 1) {
      print('Dodaj produkt');
      _openAddProductOverlay();
    }
  }

  void _openAddProductOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => ProductsScreen(onAddProduct: _addProduct),
    );
  }

  void _addProduct(Product product) {
    setState(() {
      availableProducts.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreen(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search_outlined),
            label: 'Zarządzaj listą',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Dodaj produkt',
          ),
        ],
      ),
    );
  }
}
