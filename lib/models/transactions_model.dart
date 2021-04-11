import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:spending_tracker/interfaces/transaction.dart';

class TransactionModel extends ChangeNotifier {
  final List<Transaction> _transactions = [];
  UnmodifiableListView<Transaction> get transactions =>
      UnmodifiableListView(_transactions);

  double get balance =>
      _transactions.fold(0.0, (value, element) => value + element.amount);

  void add(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }
}
