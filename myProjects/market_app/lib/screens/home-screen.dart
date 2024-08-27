import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_app/widgets/main_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _setScreen(String identifier) {}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home page'),
        ),
        drawer: MainDrawer(
          onSelectScreen: _setScreen,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopScope(
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(10.0),
                  1: FlexColumnWidth(4.0),
                  2: FlexColumnWidth(4.0),
                },
                border: TableBorder.all(),
                children: [
                  const TableRow(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Lista zakupów'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Ile kupić'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('W domu'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/products/lidl_pilos_mleko_32.png',
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('Mleko Pilos 3.2%')
                            ],
                          ),
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '1',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '0',
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
