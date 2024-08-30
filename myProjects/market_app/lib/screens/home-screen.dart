import 'package:flutter/material.dart';

import 'package:market_app/widgets/main_drawer.dart';
import 'package:market_app/widgets/table.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  void _setScreen(String identifier) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Strona główna'),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              ShoppingTable(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
