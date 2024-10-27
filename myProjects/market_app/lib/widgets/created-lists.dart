import 'package:flutter/material.dart';
import 'package:market_app/providers/products-list.dart';

class CreatedLists extends StatefulWidget {
  const CreatedLists({super.key});

  @override
  State<CreatedLists> createState() => _CreatedListsState();
}

class _CreatedListsState extends State<CreatedLists> {
  final ScrollController _scrollController = ScrollController();
  bool _tileExpanded = false;

  Future<void> _refreshProducts() async {
    await Future.delayed(Duration(seconds: 2));

    print('refreshing');
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _refreshProducts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('Brak dostępnej listy.'),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: ExpansionTile(
          title: const Text('Lista X'),
          trailing: Icon(_tileExpanded
              ? Icons.arrow_drop_down_circle
              : Icons.arrow_drop_up),
          collapsedBackgroundColor:
              Theme.of(context).colorScheme.primaryContainer,
          backgroundColor:
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
          visualDensity: VisualDensity.comfortable,
          expansionAnimationStyle: AnimationStyle(
              duration: Durations.medium2, curve: Curves.fastOutSlowIn),
          children: [
            Align(
              alignment: Alignment.topCenter,
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
                          Text('Produkt'),
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
                  for (var item in availableProductsList)
                    TableRow(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Text(item.title),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Text(item.quantity.toString()),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Text(item.quanitityHome.toString()),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() {
              _tileExpanded = expanded;
            });
          },
        ),
      ),
      bottomNavigationBar: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 16,
            ),
          ),
          onPressed: () {
            print('new list');
          },
          child: Text('Stwórz nową liste')),
    );
  }
}
