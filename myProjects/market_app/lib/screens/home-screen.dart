import 'package:flutter/material.dart';
import 'package:market_app/screens/products-screen.dart';
import 'package:market_app/widgets/grocery_table.dart';

import 'package:market_app/widgets/main_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  void _setScreen(String identifier) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: GroceryTable(),
          ),
          Center(
            child: ProductsScreen(),
          ),
          Center(
            child: Text('data'),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: _tabController,
          indicatorColor: Colors.teal,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.black54,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.shopping_cart),
            ),
            Tab(
              icon: Icon(Icons.add_box_outlined),
            ),
            Tab(
              icon: Icon(Icons.question_mark),
            ),
          ],
        ),
      ),
    );
  }
}
