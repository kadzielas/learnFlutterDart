//family - it's page for manage family - add, remove or modify members
//also to grant role [permisson].

import 'package:flutter/material.dart';
import 'package:market_app/widgets/hamburger_menu.dart';

class FamilyScreen extends StatelessWidget {
  const FamilyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rodzina'),
      ),
      drawer: const HamburgerMenu(
        onSelectScreen: setScreen,
      ),
    );
  }
}
