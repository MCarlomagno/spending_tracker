import 'package:spending_tracker/interfaces/transaction.dart';
import 'package:spending_tracker/repositories/transactions_repository.dart';
import 'package:spending_tracker/services/authentication_service.dart';
import 'package:spending_tracker/setup.dart';

class TransactionsService {
  var transactionsRepository = new TransactionsRepository();
  var _authenticationService = getIt.get<AuthenticationService>();

  create({required Transaction transaction}) async {
    await transactionsRepository.create(transaction);
  }

  Future<List<Transaction>> getAll() async {
    String uid = _authenticationService.currentUser!.uid;
    List<Transaction> allTransactions =
        await transactionsRepository.getAll(uid: uid);
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
