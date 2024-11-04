//stats - page to view statistics about purchase history, most buying products,
//money spent by month and year, - to be honest I need to think more about that because it's not about
//specific products so I don't know value of them.... hmmm....

import 'package:flutter/material.dart';
import 'package:market_app/widgets/hamburger_menu.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statystyki'),
      ),
      drawer: const HamburgerMenu(
        onSelectScreen: setScreen,
      ),
    );
  }
}
