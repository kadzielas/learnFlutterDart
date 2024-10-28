import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:market_app/screens/tabs/lists_screen.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(255, 72, 195, 158),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    const App(),
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
