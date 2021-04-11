import 'package:spending_tracker/interfaces/payment.dart';
import 'package:spending_tracker/repositories/transactions_repository.dart';

class TransactionsService {
  List<Payment> _transactions = [];
  var transactionsRepository = new TransactionsRepository();

  create({required Payment payment}) async {
    await transactionsRepository.create(payment);
    this._transactions.add(payment);
  }

  getAll() async {
    var allPayments = await transactionsRepository.getAll();
    return allPayments;
  }
}
