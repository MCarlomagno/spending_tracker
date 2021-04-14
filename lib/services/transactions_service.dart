import 'package:spending_tracker/interfaces/payment.dart';
import 'package:spending_tracker/repositories/transactions_repository.dart';

class PaymentsService {
  var transactionsRepository = new TransactionsRepository();

  create({required Payment payment}) async {
    await transactionsRepository.create(payment);
  }

  Future<List<Payment>> getAll() async {
    List<Payment> allPayments = await transactionsRepository.getAll();
    return allPayments;
  }

  Future<void> deleteAll() async {
    await transactionsRepository.deleteAll();
  }
}
