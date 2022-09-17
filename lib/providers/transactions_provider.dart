import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionsProvider with ChangeNotifier {
  List<Transaction> allTransactionList = [
    Transaction(
        category: 'Grocery',
        details: 'Eataly donwtown',
        logoUrl: 'assets/images/grocery_category_icon.png',
        amount: '- \$60.68',
        date: 'Aug 26',
        isExpense: true),
    Transaction(
        category: 'Transport',
        details: 'UBER Pool',
        logoUrl: 'assets/images/transport_category_icon.png',
        amount: '- \$6.00',
        date: 'Aug 26',
        isExpense: true),
    Transaction(
        category: 'Payment',
        details: 'August Salary',
        logoUrl: 'assets/images/salary_category_icon.png',
        amount: '+ \$650.00',
        date: 'Aug 26',
        isExpense: false),
    Transaction(
        category: 'Payment',
        details: 'Transfer From Client',
        logoUrl: 'assets/images/salary_category_icon.png',
        amount: '- \$59.90',
        date: 'Aug 25',
        isExpense: false),
    Transaction(
        category: 'Grocery',
        details: 'Costco Restaurant',
        logoUrl: 'assets/images/grocery_category_icon.png',
        amount: '- \$19.50',
        date: 'Aug 25',
        isExpense: true),
  ];

  List<Transaction> get todaysTransaction {
    return allTransactionList.where((tx) => tx.date == 'Aug 26').toList();
  }

  List<Transaction> get yesterdaysTransaction {
    return allTransactionList.where((tx) => tx.date == 'Aug 25').toList();
  }

  List<Transaction> get incomeTransaction {
    return allTransactionList.where((tx) => tx.isExpense == false).toList();
  }

  List<Transaction> get expenseTransaction {
    return allTransactionList.where((tx) => tx.isExpense == true).toList();
  }
}
