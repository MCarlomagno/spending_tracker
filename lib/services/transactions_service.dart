import 'package:spending_tracker/interfaces/transaction.dart';
import 'package:spending_tracker/repositories/transactions_repository.dart';

class TransactionsService {
  var transactionsRepository = new TransactionsRepository();

  create({required Transaction transaction}) async {
    await transactionsRepository.create(transaction);
  }

  Future<List<Transaction>> getAll() async {
    List<Transaction> allTransactions = await transactionsRepository.getAll();
    return allTransactions;
  }

  Future<void> deleteById(String id) async {
    await transactionsRepository.deleteById(id);
  }

  Future<void> patchById(String id, {String? detail}) async {
    Transaction? transaction = await transactionsRepository.getById(id);
    if (transaction != null) {
      transaction.detail = detail;
      await transactionsRepository.updateById(id, transaction);
    }
  }
}
