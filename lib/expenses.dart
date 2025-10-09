import 'package:expense_tracker_fa2025/expenses_list.dart';
import 'package:expense_tracker_fa2025/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

  State<Expenses> createState(){
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses>{
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Cheeseburger',
      amount: 12.45,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text("Chart"), 
        ExpensesList(expenses:_registeredExpenses)
        ]),
    );
  }
  
}