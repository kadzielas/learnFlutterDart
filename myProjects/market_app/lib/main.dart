import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:market_app/screens/home-screen.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(255, 72, 195, 158),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

Future<void> main() async {
  try {
    await dotenv.load(fileName: "dev.env");
  } catch (e) {
    print('Error loading .env file: $e');
  }
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const DefaultTabController(
        length: 3,
        child: HomeScreen(
          title: "Bercik Cart!",
        ),
      ),
    );
  }
}
