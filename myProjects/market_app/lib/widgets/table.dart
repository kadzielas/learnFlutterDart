import 'package:flutter/material.dart';
import 'package:market_app/data/products_data.dart';

class ShoppingTable extends StatelessWidget {
  const ShoppingTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
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
        for (var product
            in availableProducts.where((product) => product.bucket == true))
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
    );
  }
}
