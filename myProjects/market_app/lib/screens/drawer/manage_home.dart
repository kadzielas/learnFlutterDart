//manage home - page to manage products at home (e.g. water 2, orange 4 etc...)
//these count will be used to show it also in products_screen / new_product
//while adding products into list to buy

import 'package:flutter/material.dart';
import 'package:market_app/widgets/hamburger_menu.dart';

class ManageHomeScreen extends StatelessWidget {
  const ManageHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zarządzanie domem'),
      ),
      drawer: const HamburgerMenu(
        onSelectScreen: setScreen,
      ),
    );
  }
}
