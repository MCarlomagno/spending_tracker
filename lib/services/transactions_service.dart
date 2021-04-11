import 'package:spending_tracker/interfaces/payment.dart';
import 'package:spending_tracker/repositories/transactions_repository.dart';

class TransactionsService {
  List<Payment> _transactions = [];

  create({required Payment payment}) async {
    var repo = new TransactionsRepository();
    await repo.create(payment);
    this._transactions.add(payment);
  }
}
