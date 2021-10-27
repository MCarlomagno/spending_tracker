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

  Future<void> deleteById(int id) async {
    await transactionsRepository.deleteById(id);
  }

  Future<void> patchById(int id, {String? detail}) async {
    Payment? payment = await transactionsRepository.getById(id);
    if (payment != null) {
      payment.detail = detail;
      await transactionsRepository.updateById(id, payment);
    }
  }
}
