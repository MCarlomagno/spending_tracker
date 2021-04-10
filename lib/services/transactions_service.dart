import 'package:spending_tracker/models/transaction.dart';

class TransactionsService {
  List<Transaction> _transactions = [];

  create({required Transaction transaction}) {
    this._transactions.add(transaction);
  }
}
