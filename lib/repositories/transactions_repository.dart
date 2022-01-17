import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spending_tracker/interfaces/transaction.dart' as model;

class TransactionsRepository {
  CollectionReference transactions =
      FirebaseFirestore.instance.collection('transactions');

  Future<String> create(model.Transaction transactin) async {
    DocumentReference<Object?> result =
        await transactions.add(transactin.toMap());
    return result.id;
  }

  Future<model.Transaction?> getById(String id) async {
    DocumentReference<Object?> ref = transactions.doc(id);
    DocumentSnapshot<Object?> result = await ref.get();
    return model.Transaction.fromMap(
        result.data() as Map<String, dynamic>, result.id);
  }

  Future<List<model.Transaction>> getAll({required String uid}) async {
    QuerySnapshot<Object?> query =
        await transactions.where('uid', isEqualTo: uid).get();
    var allBuckets = query.docs
        .map((e) =>
            model.Transaction.fromMap(e.data() as Map<String, dynamic>, e.id))
        .toList()
        .reversed
        .toList();
    return allBuckets;
  }

  Future<void> deleteById(String id) async {
    await transactions.doc(id).delete();
  }

  Future<void> updateById(String id, model.Transaction transaction) async {
    await transactions.doc(id).set(transaction.toMap());
  }
}
