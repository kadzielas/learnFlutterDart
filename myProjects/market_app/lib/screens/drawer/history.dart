//history - here user is able to check purchase history, probably it will be
//sorted list of products that has been bought from newest to oldest
//also we will be able to select view - general or specific list

import 'package:flutter/material.dart';
import 'package:market_app/widgets/hamburger_menu.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historia zakupów'),
      ),
      drawer: const HamburgerMenu(
        onSelectScreen: setScreen,
      ),
    );
  }
}
