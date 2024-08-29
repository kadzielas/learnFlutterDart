import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_app/screens/home-screen.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({
    super.key,
  });

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  // void _selectPage(int index) {
  //   if (index == 1) {
  //     // Nawigacja do ProductsScreen po kliknięciu w "Dodaj produkt"
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (ctx) => ProductsScreen(),
  //       ),
  //     );
  //   } else {
  //     setState(() {
  //       _selectedPageIndex = index;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      bottomNavigationBar: BottomNavigationBar(
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
