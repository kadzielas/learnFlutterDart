import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:market_app/models/constants.dart';
import 'package:market_app/providers/database_connection.dart';
import 'package:market_app/screens/tabs/lists_screen.dart';

bool isLoading = true;
String pageTitle = 'Bercik Cart';

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
      home: DefaultTabController(
        length: 3,
        child: ListsScreen(
          title: pageTitle,
        ),
      ),
    );
  }
}
