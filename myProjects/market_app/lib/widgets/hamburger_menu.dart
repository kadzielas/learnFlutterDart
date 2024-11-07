//hamburger menu - drawer widget to move into e.g. family or settings page

import 'package:flutter/material.dart';
import 'package:market_app/main.dart';
import 'package:market_app/screens/drawer/family.dart';
import 'package:market_app/screens/drawer/history.dart';
import 'package:market_app/screens/drawer/manage_home.dart';
import 'package:market_app/screens/drawer/settings.dart';
import 'package:market_app/screens/drawer/stats.dart';
import 'package:market_app/screens/tabs/lists_screen.dart';

void setScreen(String identifier) {}

class HamburgerMenu extends StatefulWidget {
  const HamburgerMenu({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  State<HamburgerMenu> createState() => _HamburgerMenuState();
}

class _HamburgerMenuState extends State<HamburgerMenu> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final secondaryColor = Theme.of(context).colorScheme.onPrimaryContainer;
    String textXD = 'jebac';
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Row(
              children: [
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'A&S',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          ListTile(
            tileColor: _isSelected ? Colors.grey : null,
            leading: Icon(
              Icons.label_important_sharp,
              size: 26,
              color: primaryColor,
            ),
            title: Text(
              'Strona główna',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: secondaryColor, fontSize: 24),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListsScreen(
                    title: textXD,
                  ),
                ),
              );
              setState(() {
                _isSelected = true;
              });
            },
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size: 26,
              color: primaryColor,
            ),
            title: Text(
              'Zarządzanie domem',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: secondaryColor, fontSize: 24),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ManageHomeScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.family_restroom,
              size: 26,
              color: primaryColor,
            ),
            title: Text(
              'Rodzina',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: secondaryColor, fontSize: 24),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FamilyScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.query_stats_outlined,
              size: 26,
              color: primaryColor,
            ),
            title: Text(
              'Statystyki',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: secondaryColor, fontSize: 24),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StatsScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.history,
              size: 26,
              color: primaryColor,
            ),
            title: Text(
              'Historia zakupów',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: secondaryColor, fontSize: 24),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HistoryScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: primaryColor,
            ),
            title: Text(
              'Ustawienia',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: secondaryColor, fontSize: 24),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              size: 26,
              color: primaryColor,
            ),
            title: Text(
              'Wylogowywanie',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: secondaryColor, fontSize: 24),
            ),
            onTap: () {
              const Text('log out');
            },
          ),
          const Spacer(),
          const Text(
            '--ver a0.17',
            style: TextStyle(color: Color.fromARGB(100, 0, 0, 0)),
          )
        ],
      ),
    );
  }
}
