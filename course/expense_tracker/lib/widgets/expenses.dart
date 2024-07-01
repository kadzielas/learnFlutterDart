import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Kac food',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Kac cinema',
        amount: 10.99,
        date: DateTime.now(),
        category: Category.leisure)
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 183, 14, 198),
          actions: [
            IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Column(
          children: [
            const Text('test'),
            Expanded(
              child: ExpensesList(expenses: _registeredExpenses),
            )
          ],
        ));
  }
}
