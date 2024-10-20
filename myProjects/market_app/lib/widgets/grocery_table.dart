import 'package:flutter/material.dart';
import 'package:market_app/data/products_data.dart';

class GroceryTable extends StatefulWidget {
  const GroceryTable({super.key});

  @override
  State<GroceryTable> createState() => _GroceryTableState();
}

class _GroceryTableState extends State<GroceryTable> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(10.0),
              1: FlexColumnWidth(3.0),
              2: FlexColumnWidth(3.0),
            },
            border: const TableBorder(
              horizontalInside: BorderSide(width: 0.1),
            ),
            children: [
              const TableRow(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Lista zakupów'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Ile kupić'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('W domu'),
                    ],
                  ),
                ],
              ),
              for (var product in availableProducts
                  .where((product) => product.bucket == true))
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                            Text(product.title),
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
    );
  }
}
