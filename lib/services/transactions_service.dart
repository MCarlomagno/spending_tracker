import 'package:spending_tracker/interfaces/transaction.dart';

class TransactionsService {
  List<Transaction> _transactions = [];

  create({required Transaction transaction}) async {
    await Future.delayed(Duration(milliseconds: 1000));
    this._transactions.add(transaction);
  }
}
