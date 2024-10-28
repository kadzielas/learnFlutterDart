import 'package:flutter/material.dart';
import 'package:market_app/providers/lists.dart';
import 'package:market_app/providers/products_list.dart';
import 'package:market_app/widgets/new_list.dart';

class CreatedLists extends StatefulWidget {
  const CreatedLists({super.key});

  @override
  State<CreatedLists> createState() => _CreatedListsState();
}

class _CreatedListsState extends State<CreatedLists> {
  final ScrollController _scrollController = ScrollController();

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

  void _newListOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => const NewList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Widget content = const Center(
    //   child: Text('Brak dostępnej listy.'),
    // );

    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: lists.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ExpansionTile(
                  title: Text(lists[index].title),
                  trailing: const Icon(Icons.arrow_drop_down),
                  collapsedBackgroundColor:
                      Theme.of(context).colorScheme.primaryFixed,
                  backgroundColor: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.3),
                  visualDensity: VisualDensity.comfortable,
                  expansionAnimationStyle: AnimationStyle(
                      duration: Durations.medium2, curve: Curves.fastOutSlowIn),
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SingleChildScrollView(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                            for (var item in availableProductsList
                                .where((item) => item.id < 6))
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
                    ),
                  ],
                ),
              );
            }),
      ),
      bottomNavigationBar: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 16,
          ),
        ),
        onPressed: () {
          _newListOverlay();
        },
        child: const Text('Stwórz nową liste'),
      ),
    );
  }
}
