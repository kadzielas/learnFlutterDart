//lists_screen - main page (home page) that allow us to check created lists or create new one

import 'package:flutter/material.dart';
import 'package:market_app/providers/database_connection.dart';
import 'package:market_app/screens/tabs/products_screen.dart';
import 'package:market_app/widgets/created_lists.dart';
import 'package:market_app/widgets/hamburger_menu.dart';
import 'package:market_app/login_form.dart';

class ListsScreen extends StatefulWidget {
  const ListsScreen({super.key, required this.title});

  final String title;

  @override
  State<ListsScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ListsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    loadData();
    connect();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

//widget that make loading screen
  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget loadingScreen = const Center(
      child: CircularProgressIndicator(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const HamburgerMenu(
        onSelectScreen: setScreen,
      ),
      body: isLoading
          ? loadingScreen
          : TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const <Widget>[
                Center(
                  child: CreatedLists(),
                ),
                Center(
                  child: ProductsScreen(),
                ),
                Center(
                  child: LoginForm(),
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
