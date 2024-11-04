//settings - page to manage own account (change password, name, e-mail, app layout,
//notifications sound etc...)

import 'package:flutter/material.dart';
import 'package:market_app/widgets/hamburger_menu.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ustawienia'),
      ),
      drawer: const HamburgerMenu(
        onSelectScreen: setScreen,
      ),
    );
  }
}
