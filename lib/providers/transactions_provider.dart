import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionsProvider with ChangeNotifier {
  List<Transaction> recentTransactionList = [
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
  ];
}
