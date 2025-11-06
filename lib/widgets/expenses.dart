import 'package:expense_tracker_fa2025/widgets/chart/chart.dart';
import 'package:expense_tracker_fa2025/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_fa2025/models/expense.dart';
import 'package:expense_tracker_fa2025/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

@override
  State<Expenses> createState(){
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses>{
    void _openAddExpenseOverlay(){
    showModalBottomSheet(
    context: context,
    builder: (ctx) => NewExpense(onAddExpense: _addExpense,),
    isScrollControlled: true,
    );
  }

  void _addExpense(Expense expense){
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  _removeExpense(Expense expense){
    int expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Expense Deleted'),
      duration: Duration(seconds: 5),
      action: SnackBarAction(label: 'Undo', onPressed: (){
        setState(() {
          _registeredExpenses.insert(expenseIndex, expense);
        });
      })
    ));
  }

  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Cheeseburger',
      amount: 12.45,
      date: DateTime.now(),
      category: Category.food,
    ),
        Expense(
      title: 'Fries',
      amount: 5.45,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text("Click the + button to add an Expense!"));

    if(_registeredExpenses.isNotEmpty){
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        centerTitle: true, 
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
             icon: const Icon(Icons.add),
             ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses:_registeredExpenses), 
        Expanded(child: mainContent)
        ]),
    );
  }
  
}