import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:market_app/providers/database_connection.dart';

import 'package:market_app/screens/tabs/lists_screen.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(255, 72, 195, 158),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);
bool isLoading = true;

void main() async {
  dotenv.load(fileName: ".env");
  connect();
  await loadData();
  runApp(
    const App(),
  );
}

Future<void> loadData() async {
  await Future.delayed(
    const Duration(seconds: 2),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const DefaultTabController(
        length: 3,
        child: ListsScreen(
          title: "Bercik Cart!",
        ),
      ),
    );
  }
}
